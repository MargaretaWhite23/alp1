####

ou=$(echo -e "\n\n\n" | abuild-keygen 2>&1)
echo $ou | grep -oE ' \/home\/(.)*\.rsa\.pub' | sed 's/ //g'
rsapub=$(echo $ou | grep -oE ' \/home\/(.)*\.rsa\.pub' | sed 's/ //g')
rsa=$(echo $rsapub|grep -oE '/.*\.rsa')
mkdir -p ~/.abuild
echo 'PACKAGER_PRIVKEY="$rsa"'>~/.abuild/abuild.conf


