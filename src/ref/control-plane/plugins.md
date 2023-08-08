# CE Plugins

CE plugins dynamically loadable modules.

## DESCRIPTION

The CE plugins are dynamic libraries that implement the `CePlugin` trait. They
can evaluate filesystem operations and provide recommendations on what should
happen next.

## PLUGIN CONFIGURATION

The configuration for each plugin is defined in the `/etc/resiliate/ce.toml` file.
The specific configuration for each plugin is defined in the documentation for
that plugin.

