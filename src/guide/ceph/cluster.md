# Minimal CEPH Cluster Setup Guide (*alpha*)

Here's a guide to setting up a minimal CEPH cluster for testing purposes.
It assumes you're using Ubuntu 22.04, and will install a one-node CEPH cluster.
This guide also assumes you're familiar with virtual machines and have one set
up already.

## IMPORTANT NOTE: Alpha Support for CEPH in Resiliate

Please be aware that, as of this writing, support for CEPH storage in Resiliate
is in an alpha stage. This means that while basic functionalities have been
implemented and tested, comprehensive support and full stability are not yet
guaranteed.

Alpha-level software is usually not feature complete and might contain bugs. These
versions are released for users to test and provide feedback, helping developers
identify issues, understand user experience, and receive suggestions for improvements.

While using Resiliate with CEPH, you may encounter unexpected behavior, bugs, or
other issues. We strongly encourage users to report any issues they encounter,
which will be invaluable in improving the support for CEPH.

In light of the alpha status of CEPH support, we recommend using Resiliate with
CEPH for testing, development, and non-critical applications. For production
environments and applications that require high reliability and stability, it
may be best to wait until CEPH support has reached a more mature stage in its
development cycle.

We appreciate your understanding and patience as we work on providing robust and
reliable support for CEPH in Resiliate. Your feedback and contributions during
this period are greatly appreciated.

## 1. Pre-requisites

- A Virtual Machine with Ubuntu 22.04 installed.
- Sudo or root privileges on the VM.
- Stable Internet connection for downloading packages.

## 2. Installing CEPH

First, update the system and install NTP:

```bash
sudo apt-get update
sudo apt-get install ntp -y
```

Install CEPH:

```bash
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-octopus/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
sudo apt-get update
sudo apt-get install ceph-deploy -y
```

## 3. Creating the CEPH Cluster

Create a new directory for configuration:

```bash
mkdir ~/ceph-cluster
cd ~/ceph-cluster
```

Create a new cluster:

```bash
ceph-deploy new {your-node}
```

Replace `{your-node}` with your node's hostname.

## 4. Configuring the CEPH Cluster

Update your Ceph configuration file, found in your `ceph-cluster` directory,
with the following lines to the `[global]` section:

```bash
echo "osd pool default size = 1" >> ceph.conf
echo "osd crush chooseleaf type = 0" >> ceph.conf
```

## 5. Installing CEPH

```bash
ceph-deploy install {your-node}
```

Replace `{your-node}` with your node's hostname.

## 6. Creating the Monitor Daemon

```bash
ceph-deploy mon create-initial
```

## 7. Creating the OSD

This guide uses a directory for the OSD for simplicity, which is not suitable for
production environments.

Create a directory for the OSD:

```bash
sudo mkdir /srv/osd
sudo chown ceph:ceph /srv/osd
```

Prepare and activate the OSD:

```bash
ceph-deploy osd prepare {your-node}:/srv/osd
ceph-deploy osd activate {your-node}:/srv/osd
```

Replace `{your-node}` with your node's hostname.

## 8. Checking the Cluster

```bash
ceph status
```

The cluster should be active and clean.

## 9. Setting up CEPH Client

To access the cluster, you'll need to set up a CEPH client:

```bash
sudo apt get install -y ceph-fuse python-ceph python-rados python-rbd \
    python-cephfs librados2 librbd1 libcephfs1 libradosstriper1 python-rgw
```

If the CEPH installation and setup were successful, you should be able to
create, mount and use RADOS block devices on your VM to store AIFS data.

This is a minimal, non-redundant setup. In a production environment, you'd want
multiple OSDs and monitors for redundancy and performance. Also, don't use
directories as OSDs in production.

Make sure to replace `{your-node}` with your hostname where applicable in the
above commands.

For a more comprehensive guide to setting up CEPH, see the
[official CEPH documentation](http://docs.ceph.com/docs/master/start/).

## Important Note

This setup can provide a functional testing environment for Resiliate,
but it's important to note that this is a minimal setup designed for getting
started and testing out the basic functionality. The CEPH setup described here is a
single-node cluster with non-redundant storage, which means that it lacks the
redundancy and fault tolerance that a full, production-grade CEPH cluster would provide.

Before starting to test Resiliate, make sure the CEPH cluster is functioning as
expected. The command `ceph status` can be used to check the health of the cluster.
If the cluster status is `HEALTH_OK`, then you can proceed with setting up Resiliate.

When setting up Resiliate on this system, ensure that it is properly configured to
use the CEPH storage. The details of this will depend on the specific requirements
and options provided by Resiliate.

Moreover, the CEPH setup in this guide doesn't have any safeguards against data
corruption that could be caused by hardware failures, software bugs, or other
problems. Given that Resiliate includes features to protect against data corruption,
this minimal environment could be used to test these features under controlled
conditions. However, a real-world production setup would include more comprehensive
data protection measures at both the CEPH level and the filesystem level.

Please refer to the Resiliate and CEPH documentation or consult with a qualified
system administrator to ensure your testing setup meets your specific needs.
