# Kemal healthcheck handler

> Handler that returns 200 ok page for /healthcheck in Kemal.
>
> Useful for AWS load balancers or monitoring tools.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  kemal-healthcheck-handler:
    github: qbart/kemal-healthcheck-handler
```

## Usage

```crystal
require "kemal-healthcheck-handler"

add_handler(HealthcheckHandler.new)
```