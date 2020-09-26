bin=/data/data/com.termux/files/usr/bin
cd ~/kernelmaker
su -c cp kernel.sh $bin/kmaker && su -c chmod +x $bin/kmaker
rm ~/kernelmaker
echo "Successful! Type "kmaker" "
