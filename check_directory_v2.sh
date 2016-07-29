#!/bin/bash

cdir ()
{
if [ -z "$1" ]
then echo "Missing Directory Entry"
else
echo "Directory being created is \"$1\""
fi

if [ -z "$2" ]
then echo "Missing Permissions"
else
echo "Permission settings for $1 will be \"$2\""
fi

if [ -z "$3" ]
then echo "Missing Ownership"
else
echo "Owner and group permissions for $1 will be \"$3\""
fi

#Verify if directory exists

echo "Verifying if $1 directory exists"

if [ -d "$1" ]; then echo "The directory exists...Moving on......"
else
echo "creating directory";mkdir $1
fi

#Verify Permissions
echo "Verifying permissions on $1"

perms=$(stat $1 | sed -n '/^Access: (/{s/Access: (\([0-9]\+\).*$/\1/;p}')
if [[ $perms = 0$2 ]]; then echo "The permissions for $1 are correct"
else
echo "Fixing permissions for $1";chmod $2 $1;
fi

echo "Verifying ownership of $1"

own=$(stat -c "%U%G" $1)
if [[ $own = "$3$3" ]];then echo "Ownership is correct"
else
echo "Ownership is not correct...Fixing......";chown $3:$3 $1;
fi

}

cdir /data 755 root
cdir /data/fds 755 root
cdir /data/fds/audio 750 pindrop
cdir /data/fds/encrypted_audio 700 pindrop
