# Resiliate Filesystem

## NAME

`aifs filesystem` - The filesystem manager

## DESCRIPTION

Resiliate Filesystem commands allow you to manage the organization of Resiliate
file systems.

## USAGE

``` bash
aifs {COMMAND} [OPTIONS] {ARGS}
```

## SYNOPSIS

|COMMAND                               |SUMMARY                         |
|--------------------------------------|--------------------------------|
|`aifs mount <src> <mp>`                 |Mount a filesystem.             |
|`aifs umount <mp>`                      |Unmount a filesystem.           |
|`aifs mkfs <target>`                    |Create a Resiliate filesystem.  |

## OPTIONS

### `mount <source> <mount-point>`

Mount Resiliate filesystem.

Verify usage of unstable features.

#### `-o <MOUNT-OPTIONS>`

Storage driver options.

MOUNT-OPTIONS is one of:

  control-plane=&lt;path&gt;        Path to where the control-plane directory.

  enforcement[=on|off]              Enable or disable enforcement

  lib-dir=&lt;path&gt;              Path to the directory containing the plugins.


#### `--thread <NUMBER>`

Number of threads to use for the AiFs filesystem

[default: 4]


Back-end storage driver.

### `umount <mount-point>`

Unmount a Resiliate filesystem.

### `mkfs <target>`

Initialize (create) a new Resiliate filesystem.

#### `-D, --driver <backend>`

Backend-store determines what type of storage you want to use Resiliate on.
(default: logfs) [possible values: flat-file, key-value]

#### `-s, --source <source>`

Source directory or block device, used to populate the data.
If not specified, no data is populated.

