# Introduction to Resiliate® 2.0

Welcome to Resiliate® 2.0, an enterprise-level software package designed to mitigate
the effects of ransomware and other malicious activities that lead to data loss.

At the heart of Resiliate® is AiFS, an advanced filesystem that aims to prevent
data loss, provide quick recovery options, and achieve short Recovery Point
Objectives (RPOs) and Recovery Time Objectives (RTOs).

## What's new in Resiliate® 2.0?

Resiliate® 2.0 is a significant upgrade from its predecessor, Resiliate® 1.0.
The new version is a complete rewrite, transforming Resiliate® into a plugin-driven
system. This change allows for greater flexibility and customization, catering
to a wide range of enterprise needs.

In Resiliate® 2.0, we've introduced a unified interface for interacting with the
filesystem, the CE engine, plugins, back-end stores, and the statistical and AI
models. This unified interface enhances the user experience, making it easier to
interact with and manage the system.


### Key Features of Resiliate® 2.0

Here are some of the key features introduced in Resiliate® 2.0:

* **Plugins:** Resiliate® 2.0 introduces plugins, which are dynamic libraries
  that implement the CePlugin trait. These plugins can evaluate filesystem operations
  and provide recommendations on what should happen next.

* **Control Plane:** The Control Plane provides a unified interface for interacting
  with the CE engine, plugins, back-end stores, and the statistical and AI models.
  It is implemented as a filesystem, with each plugin having its own directory.
 

## New Components in Resiliate® 2.0

```mermaid
mindmap
  root((Resiliate))
    AiFS["AiFS"]
      IntegratedWith["Integrated with CellFS"]
    ControlPlane["Control Plane"]
      UnifiedInterface["Unified Interface"]
        CEEngine["CE Engine"]
          Plugins["Plugins"]
    Includes["Includes"]
      MetricsSystem["Metrics System"]
      AiFSFuseInterface["AiFS Fuse Interface"]
      CommandLineTool["Command-line Tool"]
      SecurityPlugins["Security Plugins"]
    FutureEnhancement["Future Enhancement"]
      AiKV["AiKV"]
        KVStore["KV Store"]
```

### AiFs

AiFS is the upper filesystem that provides POSIX semantics out-of-the-box.
It's structured with an upper directory (working directory),
a quarantine directory, and a lower directory (containing most of the data).

AiFS coordinates the filesystem operations for each request based on the results
provided by _Cybernetic Engrams_ of each file.


### Plugins

Plugins are dynamic libraries that implement the CePlugin trait. They are
loaded by the CE at runtime based on the configuration file. Each plugin can
evaluate filesystem operations and provide a recommendation on what should
happen next.

### Control Plane

The control plane provides a unified interface for interacting with CE Engine, plugins,
back-end stores, and the statistical and AI models. It is implemented as a filesystem,
with each plugin having its own directory.

## Resiliate® Package

Resiliate® is the overall package that bundles AiFS, utilities, CellFS kernel DKMS
module, and various other add-on packages.

This is also plugin-driven, and there are packages for each of these. Resiliate®
is supported on various platforms, including x86_64 and IBM System Z.

In summary, Resiliate® is a comprehensive solution for preventing data loss and
providing quick recovery options. It combines the design and implementation of
the filesystem structure, the CE engine, and plugins, all bundled into an
enterprise-level product. Whether you're looking to combat ransomware,
wiper-ware, or data exfiltration, Resiliate® is equipped to handle it all.

## More to come&hellip;

### Advanced Security Plugins

Enhanced security plugins are planned for AiFS, which will provide mandatory
access control (using Bell-LaPadula), mandatory integrity controls (supports
Biba and Clarke-Wilson models), and augmentation of Fuzzy Multi-level Security
(FuzzyMLS) using user-behavior and data-behavior inferences driven both by
statistical models and possibly AI.

### AiKV

AiKV is a planned Key-Value (KV) store that will provide SQL or S3 bucket semantics.

Stay tuned for more updates as we continue to enhance our system with new features
and capabilities. Welcome to the future of data security with Resiliate®!

### 3rd-party Audit and Monitoring helper-tools

You can readily use the AiFS control plane to monitor the system and get all the
statistics and information you need&mdash;including interfacing it directly with
collectors like Prometheus, Grafana, and Microsoft Sentinel.

However, we are planning to provide some helper tools such as docker configs to
make it easier to get going.
