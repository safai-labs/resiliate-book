## Prerequisites

Ensure that you have a fully operational CEPH cluster. If you do not already have a CEPH cluster set up, follow the instructions in the [official CEPH documentation](https://docs.ceph.com/en/latest/) to get started.

## Configuration

1. **Configure CEPH Block Storage (RBD):**

    Resiliate will interact with the CEPH cluster using the RADOS Block Device (RBD) interface. To set up an RBD in your CEPH cluster, follow the [RBD configuration instructions](https://docs.ceph.com/en/latest/rbd/) provided by CEPH.

2. **Map the CEPH Block Device to your system:**

    After setting up the RBD, map it to a block device on your system using the following command:

    ``` bash
    sudo rbd map poolname/devicename --name client.admin
    ```
    
    Ensure that you replace `poolname` and `devicename` with the appropriate names for your configuration.

3. **Initialize and Mount the Store:**

    Now initialize the CEPH-backed store with Resiliate filesystem and mount it at your preferred location. For example:

    ``` bash
    export AIFS_PARTITION=/dev/rbd/poolname/devicename AIFS_MOUNTDIR=/srv/cefs
    sudo aifs storage init ${AIFS_PARTITION}
    sudo mkdir -p ${AIFS_MOUNTDIR}
    sudo aifs filesystem mount ${AIFS_PARTITION} ${AIFS_MOUNTDIR}
    ```

    Your CEPH-backed Resiliate filesystem is now ready to use. Any data written to `/srv/cefs` will now be stored on your CEPH cluster.

Note: This assumes that you have installed the necessary CEPH client utilities on the same machine where you're running these commands.

Remember to always test this setup with non-critical data first, until you are confident that everything is functioning as expected.

Lastly, the performance of the Resiliate system when backed by CEPH will depend heavily on the performance and configuration of your CEPH cluster. So, ensure your CEPH cluster is well-optimized for your workload.