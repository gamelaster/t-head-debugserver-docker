# T-Head DebugServer Docker

This docker container allows you to use CKLink (and other supported adaptors) with T-Head's DebugServer isolated in Docker. By default the DebugServer comes as .sh script which installs it to the actual folder or system, although in the past, the installer did very wrong stuff (such as installing libusb.so into global lib folder, breaking some other apps depending on the libusb).

There is additional `run.sh` script, which allows you to passthrough only specific CKLink device into the container, instead of giving container full access through `--priviledged`. Right now, script detects Bouffalo Lab CKLink Lite, if you want to use another adapter, change VID & PID in the script.