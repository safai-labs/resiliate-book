# Initialization

Initialize a store on a new partition and mount this store to a location for
the file system to run on.

``` bash
export CEFS_PARTITION=/dev/sdb1 CEFS_MOUNTDIR=/srv/cefs
sudo cefs storage init ${CEFS_PARTITION}
sudo mkdir -p ${CEFS_MOUNTDIR}
sudo cefs filesystem mount ${CEFS_PARTITION} ${CEFS_MOUNTDIR}
```

You can now use `/srv/cefs` for your storage needs.

Your new CEFS filesystem is now ready to test.

**Now let's create, destroy, rectify, and analyze!**
