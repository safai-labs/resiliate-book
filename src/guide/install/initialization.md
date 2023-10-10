# Initialization

Initialize a store on a new partition and mount this store to a location for
the file system to run on.

``` bash
export AIFS_PARTITION=/dev/sdb1 AIFS_MOUNTDIR=/srv/aifs
sudo aifs mkfs ${AIFS_PARTITION}
sudo mkdir -p ${AIFS_MOUNTDIR}
sudo aifs filesystem mount ${AIFS_PARTITION} ${AIFS_MOUNTDIR}
```

You can now use `/srv/aifs` for your storage needs.

Your new Resiliate filesystem is now ready to test.

**Now let's create, destroy, rectify, and analyze!**

