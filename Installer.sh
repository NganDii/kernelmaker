
bin=/data/data/com.termux/files/usr/bin
cd ~/kernelmaker
su -c "cp kernel.sh $bin/kmaker" && chmod +x $bin/kmaker
rm -rf ~/kernelmaker
echo "Successful! Type "kmaker" "

