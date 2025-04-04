# Generic Helm Chart

## Add repository

```bash
helm repo add kubeplane https://audacioustux.github.io/kubeplane
```

## Install chart

```bash
helm install my-generic-helm kubeplane/generic-helm
```

my-generic-helm corresponds to the release name, feel free to change it to suit your needs. You can also add additional flags to the helm install command if you need to.

## Usage

Simply define Kubernetes resources under the `map` or `list` keys in release values.

### Example values.yaml

```yaml
map:
  my-config-1:
    apiVersion: v1
    kind: ConfigMap
    # metadata.name: my-config-1 is inferred from the key
    data:
      key1: value1

  my-secret-1:
    apiVersion: v1
    kind: Secret
    metadata:
      name: my-secret-1
    data:
      key1: value1
      key2: value2

list:
  - apiVersion: v1
    kind: ConfigMap
    # metadata.name: {RELEASE-NAME}-{HASH(manifest)} is inferred from the manifest
    data:
      key1: value1

  - apiVersion: v1
    kind: ConfigMap
    metadata:
      name: my-config-2
    data:
      key1: value1
```
