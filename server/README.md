# Server Setup

Config for `shire`.

## Tasks

Post setup, `task` should be installed. Use `task --list-all` for a summary of available management tasks.

## Services

Services are managed by Caddy. To add an additional service, choose a unique path and create a new block as follows:

```
handle_oath /servicepath/* {
    reverse_proxy :1234
}
```