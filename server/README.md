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

Remote management tasks are defined in `mise.toml`. Public key access to the root user is required for most tasks.

Install `mise` with `curl https://mise.run | sh`.

Use `mise tasks` for a summary of available management tasks.

## Services

Services are managed by Caddy. To add an additional service, choose a unique path and create a new block as follows:

```caddy
handle_path /servicepath/* {
    reverse_proxy :1234
}
```

You may also want to add an additional Homepage link - this can be added to [services.yaml](./homepage/services.yaml). Icons are either from [Dashboard Icons](https://dashboardicons.com/) or [Material Icons](https://pictogrammers.com/library/mdi/)

Run `mise sync` to update the remote host.

## Notes

## Beszel

When setting up the system set Host/IP to `/beszel_socket/beszel.sock` - this is the a socket in a shared Docker volume between the UI and agent containers.
