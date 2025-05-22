# Server Setup

Config for `shire`.

## Setup

Before doing anything, set up SSH public key auth and [Tailscale](https://tailscale.com/kb/1031/install-linux).

`keys.txt` contains public keys for various systems which need access - these can be copied across during initial setup.

Any server system dependencies are configured in `setup.sh`, which can be run as follows:

```bash
export remote=root@shire.bear-antares.ts.net # Amend as necessary.
rsync ./setup.sh $remote:~/setup.sh
ssh $remote "source setup.sh"
```

Don't expose anything set up with this repo to the public internet.

## Management

The Taskfile in this directory allows remote management of the server. Public key access to the root user is required for most tasks.

Install `task` with `npm install -g @go-task/cli`.

Use `task --list-all` for a summary of available management tasks.

## Services

Services are managed by Caddy. To add an additional service, choose a unique path and create a new block as follows:

```
handle_oath /servicepath/* {
    reverse_proxy :1234
}
```

Then run `task caddy` to load the new config.

## Notes

## Beszel

When setting up the system set Host/IP to `/beszel_socket/beszel.sock` - this is the a socket in a shared Docker volume between the UI and agent containers.
