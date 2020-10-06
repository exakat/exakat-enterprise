# Github Action for Exakat Enterprise

Scan with the Exakat GitHub Action your PHP code to detect tricky issues, prevent vulnerabilities and control the quality.

Exakat is a customizable static analyzer engine for all PHP 5.2 to PHP 8.0-dev Applications for better Quality, Security, Performance and Documentation

## Usage
The Exakat Github Action has to be declared in your workflow like this:

_.github/workflows/exakat.yml_

```yaml
on: [push, pull_request]
name: Test
jobs:
  exakat:
    name: Scan with Exakat
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Exakat
      uses: docker://exakat/exakat-enterprise
```

The `on` event that triggers the workflow can be adapted following the GitHub Action Documentation.

