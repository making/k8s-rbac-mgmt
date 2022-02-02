#!/bin/bash
set -euo pipefail 
ytt -f $(dirname $0)/config --data-values-file <(cat <<EOF
rbac:
  rolebindings:
  - role: ns-admin
    namespaces:
    - name: ns1
      create: true
    - name: ns2
    users:
    - name: user1
    - name: user2
    groups:
    - name: developers
    serviceaccounts:
    - name: ci-bot
  clusterrolebindings:
  - clusterrole: admin
    users:
    - name: admin
    groups:
    - name: administrators
    serviceaccounts:
    - name: admin-bot
      namespaces:
      - name: ns1
      - name: ns2
EOF)
