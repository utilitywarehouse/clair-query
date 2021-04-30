# Clair Query
Small clairctl wrapper to be used in DroneCI

## Usage
Add as a step in your pipeline. If needed, provide a docker config with auth
credentials to the repository

```
kind: pipeline
type: kubernetes
name: default

steps:
  - name: vulnerability-scanning
    image: quay.io/utilitywarehouse/clair-query
    environment:
      QUERY_REPO: myregistry.io/org/repo
      DOCKER_AUTH_CONFIG: '{"auths":{"myregistry.io":{"auth":"XXXXXXXXXXXX="}}}'
```
