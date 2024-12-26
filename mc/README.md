# mc

Minecraft server setup using Docker.

## Local Setup

- Run `docker compose up -d`.

## VPS Setup

- Ensure your machine has public key access to the VPS.
- Run `bootstrap.sh username@host`

## Configuration

Configuration should be placed `services.mc.environment`.

- Add new players to `WHITELIST`
- Change the icon by updating `data/icon.png`

Additional configuration options can be found [here](https://docker-minecraft-server.readthedocs.io/en/latest/variables/)
