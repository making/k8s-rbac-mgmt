#!/bin/bash
set -euo pipefail 
ytt -f $(dirname $0)/config --data-values-file <(cat <<EOF
rbac:
  rolebindings:
  - role:
      kind: Role
      name: ns-admin
    namespaces:
    - name: ns1
      create: true
    - name: ns2
    users:
    - name: user1
    groups:
    - name: administrators
    serviceaccounts:
    - name: admin-bot
  clusterrolebindings:
  - role:
      name: edit
    users:
    - name: user2
    - name: user3
    groups:
    - name: developers
    serviceaccounts:
    - name: ci-bot
      namespaces:
      - name: ns1
      - name: ns2
EOF)
