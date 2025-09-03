# CONTROL PLANE

## NAME

**control-plane** - Unified interface for Resiliate to mitigate ransomware
effects and data loss.

## SYNOPSIS

The control plane provides an interface between the Cybernetic Engram (CE) and
its plugins, facilitating real-time interaction and data exchange.

## DESCRIPTION

Welcome to Resiliate, an AI-driven data resiliency software solution designed to
mitigate the effects of ransomware and other malicious activities that lead to data
loss. Resiliate is an advanced filesystem that aims to prevent data loss, provide
quick recovery options, and achieve short Recovery Point Objectives (RPO) and
Recovery Time Objectives (RTO). The control plane acts as a unified interface for
interacting with the CE engine, plugins, back-end stores, and the statistical and
AI models.

The Resiliate control plane is a powerful tool for sysadmins and secadmins,
offering a detailed view into the activities, threats, and health of the
Resiliate filesystem. By leveraging the insights from the control plane,
administrators can proactively address potential threats, ensuring data integrity
and mitigating the effects of ransomware and other malicious activities.

The Resiliate control plane serves as a dedicated interface for each Resiliate filesystem,
providing real-time insights and interactions with the Cybernetic Engram (CE) and
its associated plugins. This interface is crucial for understanding the health,
threats, and activities within the Resiliate filesystem, thereby aiding in
proactive cybersecurity measures.
Control Plane Structure

### Control Plane Structure

For every Resiliate filesystem, a unique control plane is generated. The naming convention
for the control plane mirrors the mount point of the filesystem.

For instance, a filesystem mounted at `/mnt/fs1` would have its control plane
located at `/var/run/resiliate/mnt_fs1`.  Names with spaces, underscores, or other special 
characters get replaced by underscores `_`. For example for '/mnt/Home Directories', would
become `/var/run/resiliate/Home_Directories`

### Key Directories and Files

- `/`: This is the root of the control plane. It serves as the primary entry point
  for accessing all control plane functionalities and associated plugins.

- `/status`: This file provides a comprehensive overview of the current state of
  the Resiliate filesystem. It includes metrics from the CE, detailing damaged files,
  potential exfiltrations, user interactions, and specific recommendations based on
  detected threats or anomalies. The recommendations can range from auditing to
  quarantining, based on the severity and nature of the detected activity.


See [resiliate-cp-status](/ref/control-plane/resiliate-cp-status.html) for more information.


#### `/threats` File Components

This file lists potential threats detected by the CE. It categorizes threats based
on their nature, such as 'Wiper Detected' or 'Ransomware type encryption detected'.
These threats are often detected by the underlying plugins, which then relay this
information to the CE.

### Plugin Integration

Each directory present in the root of the control plane (e.g., /naive) represents
an instance of a specific plugin. These plugins are responsible for gathering granular
data and insights, which are then processed by the CE. The CE, in turn, updates its
internal state, making it accessible through the /status file.

For example, the naive directory represents an instance of the naive plugin.
The internal state and metrics of this plugin can be accessed through files
within the /naive directory. This structure allows for modular and scalable
integration of multiple plugins, each contributing to the overall cybersecurity
posture of the Resiliate filesystem.

### Core plugin

The `core` plugin provides the basic set of metrics and functionalities for the
Resiliate filesystem.

## CONFIGURATION

Control plane is configured through the corresponding ce configuration file.
See [Cybernetic Engram Control Engine](/ref/ce.html) for more information.

## USAGE

Ensure that only authorized users have access to the control plane. Regularly
update the control plane and its plugins to patch any known vulnerabilities.

## SEE ALSO

- [Resiliate Introduction](/)

## BUGS

No known issues as of the current version. Please report any bugs to the Resiliate
development team.

## AUTHOR

Resiliate Development Team. For more information, contact [support@saf.ai](mailto:support@saf.ai).
