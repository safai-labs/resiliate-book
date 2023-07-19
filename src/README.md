# Introduction t o Resiliate® 2.0

Welcome to Resiliate® 2.0, an enterprise-level software package designed to mitigate
the effects of ransomware and other malicious activities that lead to data loss. 

At the heart of Resiliate® is AiFS, an advanced filesystem that aims to prevent 
data loss, provide quick recovery options, and achieve short Recovery Point 
Objectives (RPOs) and Recovery Time Objectives (RTOs).

## Key Components

### AiFs

AiFS is the upper filesystem that provides POSIX semantics out-of-the-box. 
It's structured with an upper directory (working directory), 
a quarantine directory, and a lower directory (containing most of the data). 

AiFS coordinates the filesystem operations for each request based on the results
provided by _Cybernetic Engrams_ of each file. 

### CellFS

CellFS is a clone of NILFS2 that we've created due to some limitations of NILFS2. CellFS is used by 
the system and integrated with AiFS through a plugin interface.

### Cybernetic Engram (CE) Engine

The CE engine is the AiVM that _runs_ the Cybernetic Engrams to evaluate and perform inferences
based on the state of the data, system, users, groups, processes, and history resulting in security recommendations for file operations.

### Plugins

Plugins are dynamic libraries that implement the CePlugin trait. They are loaded by the CE at runtime based on the configuration file. Each plugin can evaluate filesystem operations and provide a recommendation on what should happen next.

### Control Plane

The control plane provides a unified interface for interacting with CE Engine, plugins, 
back-end stores, and the statistical and AI models. It is implemented as a filesystem,
with each plugin having its own directory.

## Resiliate® Package

Resiliate® is the overall package that bundles AiFS, utilities, CellFS kernel dkms, and various other add-on packages.

This is also plugin-driven, and there are packages for each of these. Resiliate® is supported on various platforms, including x86_64 and IBM System Z.

In summary, Resiliate® is a comprehensive solution for preventing data loss and providing quick recovery options. It combines the design and implementation of the filesystem structure, the CE engine, and plugins, all bundled into an enterprise-level product. Whether you're looking to combat ransomware, wiperware, or data exfiltration, Resiliate® is equipped to handle it all.



## More to come&hellip;

### Advanced Security Plugins

Enhanced security plugins are planned for AiFS, which will provide mandatory access control
(using Bell-LaPadula), mandatory integrity controls (using Biba; or Clarke-Wilson models),
and augmentation of Fuzzy Multi-level Security (FuzzyMLS) using user-behavior and
data-behavior inferences driven both by statistical models and possibly AI.

### AiKV

AiKV is a planned Key-Value (KV) store that will provide SQL or S3 bucket semantics.

Stay tuned for more updates as we continue to enhance our system with new features and capabilities. Welcome to the future of data security with Resiliate®!


### 3rd-party Audit and Monitoring helper-tools

You can readily use the AiFS control plane to monitor the system and get all the statistics and information you need—including interfacing it directly with collectors like Prometheus, Grafana, and Microsoft Sentinel.

However, we are planning to provide some helper tools such as docker configs to make it easier to get going.

