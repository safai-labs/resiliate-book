# CEFS Config

## NAME

`cefs config` - The self configurer

## DESCRIPTION

CEFS Config commands allow you to configure CEFS software and services
itself.

## USAGE

``` bash
cefs config {COMMAND} [OPTIONS] {ARGS}
```

## SYNOPSIS

|COMMAND                           |SUMMARY                       |
|----------------------------------|------------------------------|
|`cefs config [ -h \| --help ]`    |Prints this help message.     |
|`cefs config [ -V \| --version ]` |Prints current version.       |
|`cefs config upgrade`             |Upgrade CEFS software.        |
|`cefs config upgradeable`         |Check for CEFS update.        |
|`cefs config kernel`              |Configure kernel module(s).   |
|`cefs config license`             |Configure license key(s).     |
|`cefs config build-info`          |Show Build Information.       |

## OPTIONS

### `upgrade`

Upgrade CEFS software.

#### `-c, --channel <channel>`

Channel determines which build of CEFS to download, configure, and update.

### `upgradeable`

Check for CEFS update.

#### `-c, --channel <channel>`

Channel determines which build of CEFS to download, configure, and update.

### `kernel`

Configure kernel module(s).

#### `-k, --kernel-version <kernel-version>`

Kernel version to compile for. (default: current version)

### `license`

Configure license key(s).

#### `-i, --info <seed-info>`

Information used to build license seed.

### `build-info`

Show Build Information.
