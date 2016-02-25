#!/bin/bash
clear
echo "Verifying if /data directory exists"

if [ -d "/data" ]; then echo "The directory exists...Moving on......"
else
echo "creating directory";mkdir /data
fi

echo "Verifying permissions on /data"

perms=$(stat /data | sed -n '/^Access: (/{s/Access: (\([0-9]\+\).*$/\1/;p}')
if [[ $perms = 0755 ]]; then echo "The permissions for /data are correct"
else
echo "Fixing permissions for /data";chmod 755 /data;
fi

echo "Verifying ownership of /data"

own=$(stat -c "%U%G" /data)
if [[ $own = "rootroot" ]];then echo "Ownership is correct"
else
echo "Ownership is not correct...Fixing......";chown root:root /data;
fi

echo "Verifying if /data/fds directory exists"

if [ -d "/data/fds" ]; then echo "The directory exists...Moving on......"
else
echo "creating directory";mkdir /data/fds
fi

echo "Verifying permissions on /data/fds"

perms=$(stat /data/fds | sed -n '/^Access: (/{s/Access: (\([0-9]\+\).*$/\1/;p}')
if [[ $perms = 0755 ]]; then echo "The permissions for /data are correct"
else
echo "Fixing permissions for /data/fds";chmod 755 /data/fds;
fi

echo "Verifying ownership of /data/fds"

own=$(stat -c "%U%G" /data/fds)
if [[ $own = "rootroot" ]];then echo "Ownership is correct"
else
echo "Ownership is not correct...Fixing......";chown root:root /data/fds;
fi

echo "Verifying if /data/fds/audio directory exists"

if [ -d "/data/fds/audio" ]; then echo "The directory exists...Moving on......"
else
echo "creating directory";mkdir /data/fds/audio
fi

echo "Verifying permissions on /data/fds/audio"

perms=$(stat /data/fds/audio | sed -n '/^Access: (/{s/Access: (\([0-9]\+\).*$/\1/;p}')
if [[ $perms = 0750 ]]; then echo "The permissions for /data are correct"
else
echo "Fixing permissions for /data/fds/audio";chmod 750 /data/fds/audio;
fi

echo "Verifying ownership of /data/fds/audio"

own=$(stat -c "%U%G" /data/fds/audio)
if [[ $own = "pindroppindrop" ]];then echo "Ownership is correct"
else
echo "Ownership is not correct...Fixing......";chown pindrop:pindrop /data/fds/audio;
fi


echo "Verifying if /data/fds/encrypted_audio directory exists"

if [ -d "/data/fds/encrypted_audio" ]; then echo "The directory exists...Moving on......"
else
echo "creating directory";mkdir /data/fds/encrypted_audio
fi

echo "Verifying permissions on /data/fds/encrypted_audio"

perms=$(stat /data/fds/encrypted_audio | sed -n '/^Access: (/{s/Access: (\([0-9]\+\).*$/\1/;p}')
if [[ $perms = 0700 ]]; then echo "The permissions for /data/fds/encrypted_audio are correct"
else
echo "Fixing permissions for /data/fds/encrypted_audio";chmod 700 /data/fds/encrypted_audio;
fi

echo "Verifying ownership of /data/fds/encrypted_audio"

own=$(stat -c "%U%G" /data/fds/encrypted_audio)
if [[ $own = "pindroppindrop" ]];then echo "Ownership is correct"
else
echo "Ownership is not correct...Fixing......";chown pindrop:pindrop /data/fds/encrypted_audio;
fi


