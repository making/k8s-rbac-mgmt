# k8s-rbac-mgmt

```
ytt -f https://github.com/making/k8s-rbac-mgmt/raw/main/templates/rbac.yaml -v namespace=demo -v service_account_name=kapp > rbac.yaml
ytt -f https://github.com/making/k8s-rbac-mgmt/raw/main/templates/rbac-data-values.yaml -v namespace=demo > rbac-data-values.yaml
```