# Resiliate Config

## NAME

`aifs config` - The self configurer

## DESCRIPTION

Resiliate Config commands allow you to configure Resiliate software and services
itself.

## USAGE

``` bash
cefs config {COMMAND} [OPTIONS] {ARGS}
```

## SYNOPSIS

|COMMAND                           |SUMMARY                       |
|----------------------------------|------------------------------|
|`aifs config [ -h `\|` --help ]`    |Prints this help message.     |
|`aifs config [ -V `\|` --version ]` |Prints current version.       |
|`aifs config upgrade`             |Upgrade Resiliate software.        |
|`aifs config upgradeable`         |Check for Resiliate update.        |
|`aifs config kernel`              |Configure kernel module(s).   |
|`aifs config license`             |Configure license key(s).     |
|`aifs config build-info`          |Show Build Information.       |

## OPTIONS

### `upgrade`

Upgrade Resiliate software.

#### `-c, --channel <channel>`

Channel determines which build of Resiliate to download, configure, and update.

### `upgradeable`

Check for Resiliate update.

#### `-c, --channel <channel>`

Channel determines which build of Resiliate to download, configure, and update.

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
