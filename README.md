# check-nas-mount
This is a shell script to check if a disk is mounted as fstab, if not, commit "mount -a".

## Background
I run Frigate NVR with external NAS network storage for video clips. The network storage is supposed to be mounted via `fstab` everytime the machine is booted.\
But if the network storage is not mounted properly when booted (say the NAS is down for a few minutes), it won't be mounted until the Frigate machine is rebooted. This makes the Frigate store the video locally, eats up the local drive quickly and worse still, when the network storage is mounted again, the local storage won't be merged with the network storage and makes some video "missing".

## Work around
I mannualy create a `mountcheck.txt` file in the NAS directory for Frigate. Then use `crontab` to schedule a shell script check if this `mountcheck.txt` exists. If it doesn't, run `mount -a`.

## Environment
```
#docker-compose.yml
...
    volumes:
      - /home/frigate/omv_everyone/frigate/media:/media/frigate
...
```

## Usage
1. Create a `mountcheck.txt` file in the NAS directory for Frigate.
2. Modify the path in the https://github.com/upsangel/check-nas-mount/blob/main/mountcheck.sh
3. Save in your machine and `chmod +x` to allow execute.
4. Add it in the `crontab`
