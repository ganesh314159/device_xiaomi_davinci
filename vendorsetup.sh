# !/bin/sh

######## DEVICE VARIABLES ########

REMOTE="github"                       # Remote of your repository
USERNAME="ganesh314159"               # Your username on remote
DEVICE="davinci"                      # This is codename of your device
OEM="xiaomi"                          # This brand of your device
CHIPSET="sm6150"                      # This is chipset of your device
BRANCH="12.1"                         # This is branch on remote
DEVICEC="device/$OEM/$CHIPSET-common" # This is common device tree based on chipset
KERNEL="kernel/$OEM/$DEVICE"          # This is kernel for your device
KERNELH="kernel/$OEM/$DEVICE-headers" # This is kernel headers if required
VENDOR="vendor/$OEM/$DEVICE"          # This is vendor of your device
VENDORC="vendor/$OEM/$CHIPSET-common" # This is common vendor based on chipset

######## REAL CODE STARTS HERE ########

if [ -d "$DEVICEC" ] ; then
    echo "Common device tree already exists";
else
    echo "Common device tree doesn't exist";
    echo "Clonning common device tree";
    git clone https://$REMOTE.com/$USERNAME/device_${OEM}_$CHIPSET-common -b $BRANCH $DEVICEC;
fi;

if [ -d "$KERNEL" ] ; then
    echo "Kernel already exists";
else
    echo "Kernel doesn't exist";
    echo "Clonning kernel";
    git clone https://$REMOTE.com/$USERNAME/kernel_${OEM}_$DEVICE -b $BRANCH $KERNEL;
fi;

if [ -d "$KERNELH" ] ; then
    echo "Kernel headers already exists";
else
    echo "Kernel headers doesn't exist";
    echo "Clonning kernel headers";
    git clone https://$REMOTE.com/$USERNAME/kernel_${OEM}_$DEVICE-headers -b $BRANCH $KERNELH;
fi;

if [ -d "$VENDOR" ] ; then
    echo "Vendor already exists";
else
    echo "Vendor doesn't exist";
    echo "Clonning vendor";
    git clone https://$REMOTE.com/$USERNAME/vendor_${OEM}_$DEVICE -b $BRANCH $VENDOR;
fi;

if [ -d "$VENDORC" ] ; then
    echo "Common vendor already exists";
else
    echo "Common vendor doesn't exist";
    echo "Clonning common vendor";
    git clone https://$REMOTE.com/$USERNAME/vendor_${OEM}_$CHIPSET-common -b $BRANCH $VENDORC;
fi;


