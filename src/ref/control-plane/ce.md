# CE (Cybernetic Engram Control Engine) Configuration and Usage

The CE is a dynamic and extensible system designed to enhance threat detection 
and response capabilities. It achieves this by leveraging a range of plugins,
each tailored to specific threat detection methodologies. The configuration of
CE and its plugins is managed through a TOML file.

## Core Configuration

Let's go over a sample configuration file for the CE:

```toml
# Main configuration for the Cybernetic Engram Control Engine (CE)
[ce]
# Directory where the compiled plugins are stored.
# Default: The directory where CE is installed.
plugins-dir = "target/debug"

# Directory for the CE control plane.
# Default: /var/lib/resiliate/${mount_dir_flattened}
control-plane-dir = "/tmp/ce"

# Configuration for the 'core' plugin, based on the 'naive' detection methodology.
[core]
# Path to the compiled plugin. This remains constant even if the section name changes.
plugin = "libce_naive.so"

# Directory containing the necessary models for the plugin.
# Default: Directory where the CE is installed.
models-dir = "/usr/share/resiliate/lib"

# Note: The same plugin can be configured multiple times if it supports multiple instances.
# For example, another instance of the 'naive' plugin can be added as:
# [core2]
# plugin = "libce_naive.so"
# models-dir = "/usr/share/resiliate/lib2"
```

The central configuration of the CE is defined under the `[ce]` section:

- `plugins-dir`: This is the directory where the compiled plugins are stored.
  In the provided example, this is set to `/usr/lib/resiliate/plugins`.
  
- `control-plane-dir`: This directory serves as the control plane for the CE.
  By default, the mount point for the CE control plane is
  `/var/lib/resiliate/${mount_dir_flattened}`, but it can be overridden as shown
  in the example with `/tmp/ce`.

## Plugin Configuration

The CE supports multiple plugins, each defined in its section within the TOML file.
The section name determines the control plane subdirectory name for that plugin.
For instance:

- `[core]`: This section configures the `core` plugin, which is based on the
  `libce_naive.so` library.
  - `plugin`: Specifies the path to the compiled plugin. In the example,
    this is set to `libce_naive.so`.
  - `models-dir`: This directory contains the necessary models for the plugin.
    In the example, it's set to `/usr/share/resiliate/lib`.

The control plane subdirectory name is derived from the section name. So, for the
`core` plugin, the corresponding directory in the control plane would be `/core`.

It's worth noting that if a plugin supports it, it can be configured multiple times.
This allows for diverse configurations for different use cases. The `naive`
plugin, for instance, supports this feature.

## Interacting with CE and Its Plugins

1. **Accessing the Control Plane**: Navigate to the control plane root as specified
   in the `control-plane-dir` setting. By default, this would be `/var/lib/resiliate/${mount_dir_flattened}`.

2. **Viewing CE Metrics**: Access the `/status` file within the control plane root
   to view the current state and metrics of the CE. Given its fixed length, you may
   need to re-read this file periodically for updated information.

3. **Monitoring Threats**: The `/threats` file within the control plane root
   provides real-time threat detection from all configured plugins. Like the
   `/status` file, it has a fixed length, so you'll need to re-read it to get
   the latest threat data.

4. **Plugin-specific Interaction**: To interact with a specific plugin, navigate
   to its corresponding subdirectory in the control plane.
   For example, for the `core` plugin, you would go to `/core`.

## Examples

To view the current metrics of the CE:

```bash
cat /var/lib/resiliate/${mount_dir_flattened}/status
```

To check the latest threats detected by all plugins:

```bash
cat /var/lib/resiliate/${mount_dir_flattened}/threats
```
