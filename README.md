# Clair Query
Small clairctl wrapper to be used in DroneCI

## Usage
Add as a step in your pipeline. If needed, provide a docker config with auth
credentials to the repository (format like `'{"auths":{"myregistry.io":{"auth":"XXXXXXXXXXXX="}}}'`)

```
kind: pipeline
type: kubernetes
name: default

steps:
  - name: vulnerability-scanning
    image: quay.io/utilitywarehouse/clair-query:4.0.5-1
    environment:
      QUERY_REPO: myregistry.io/org/repo:tag
      DOCKER_AUTH_CONFIG:
        from_secret: DOCKER_AUTH_CONFIG
```

## Testing (@system only)
To quickly test changes in the `query` script, using an already scanned image:
  * `$ make expose-clair` (on a different terminal)
  * `$ make test`

To test a scan on a never scanned image on UW's private repo:
  * `$ make expose-clair` (on a different terminal)
  * Export DOCKER_AUTH_CONFIG with valid registry credentials
  * `$ make test-full`
