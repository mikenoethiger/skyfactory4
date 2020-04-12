# Skyfactory 4

* Default Minecraft Port: `25565`
* [Dockerhub](https://hub.docker.com/repository/docker/mikenoethiger/skyfactory4)
* [Curseforge Skyfactor 4](https://www.curseforge.com/minecraft/modpacks/skyfactory-4/files)
* [GitHub Skyfactory 4](https://github.com/DarkPacks/SkyFactory-4)
* [Multiplayer Instructions](https://github.com/DarkPacks/SkyFactory-4/wiki/Multiplayer-Instructions)
* [Minecraft Commands](https://minecraft.gamepedia.com/Commands)

## Server Installation (docker)

Initially run the following command to accept [EULA](https://account.mojang.com/documents/minecraft_eula) terms:

```
docker run --rm \
-v skyfactory4:/var/lib/skyfactory4 \
mikenoethiger/skyfactory4 ash -c 'echo "eula=true" > eula.txt'
```

This will create the docker volume where all the skyfactory data will be persisted and then write `eula=true` to `eula.txt` which is the whole eula-terms-accepting magic.
The container is automatically removed after the command terminates (ensured by `--rm`).

Now run the server as a container:

```
docker run -dit \
-p 25565:25565 \
-v skyfactory4:/var/lib/skyfactory4 \
--restart always \
--name skyfactory4 \
mikenoethiger/skyfactory4
```

Run `docker attach skyfactory4` in order to use the interactive minecraft shell. Hit `CRTL+P+Q` to exit attached mode.

Run `docker volume inspect skyfactory4` in order to get the volume path on the host system, where all the world data and so forth is stored.

## Server Installation (manual)

1. Downlod and unzip [Server Files](https://www.curseforge.com/minecraft/modpacks/skyfactory-4/files/2787018)
2. Run `install.sh`
3. *(Optional)* Update max memory usage in `settings.sh`
4. Run `ServerStart.sh` to start the server (will initially fail)
5. After intial server start failed, set `eula=true` in `eula.txt`
6. Run `ServerStart.sh` again and wait until server startet
7. In the interactive shell type `help` to get a list of available commands.
8. Type `stop` to save data and stop server.

## Load Backups

Skyfactory automatically creates backups and stores them in the `backups` folder. My common routine to load a backup is as follows (make sure to `cd` to the `skyfactory4` volume beforehand):

```bash
mkdir archive
mv world archive
mkdir world
cp backups/world/Backup--world--2020-04-11--22-18.zip world
cd world
unzip Backup--world--2020-04-11--22-18.zip
rm Backup--world--2020-04-11--22-18.zip
```

This routine is summarized in the `loadbackup.sh` script provided in this repository. Usage example:

```bash
./loadbackup.sh Backup--world--2020-04-11--22-18.zip
```

## Troubleshooting

### Problems starting SkyFactory4 Twitch client

**Errow shown:**

```
Java HotSpot(TM) 64-Bit Server VM warning: Ignoring option PermSize; support was removed in 8.0
```

**Solution:** Go to `Edit Profile` and change Java Path to `jdk8`.



