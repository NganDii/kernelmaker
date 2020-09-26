aik=/data/local/AIK-mobile
echo "KERNEL MAKER"
rm -rf ~/anykernel
rm -rf /sdcard/Kernels/anykernel
test ! -d /sdcard/Kernels && mkdir -p /sdcard/Kernels
mkdir /sdcard/Kernels/anykernel
git clone https://github.com/NganDii/anykernel
mv -f $HOME/anykernel/anykernel.zip /sdcard/Kernels/anykernel
cd /sdcard/Kernels/anykernel



unzip /sdcard/Kernels/anykernel/anykernel.zip && rm anykernel.zip

echo "Copy your boot.img to Sdcard/Kernels"
echo "Press y to continue"
read r
if [ $r == "y" ]; then
su -c "rm -rf /data/local/AIK-mobile/boot.img"
su -c mv -f /sdcard/Kernels/boot.img /data/local/AIK-mobile/
su -c "(cd /data/local/AIK-mobile && ./unpackimg.sh)"
su -c "(mv  -f /data/local/AIK-mobile/split_img/boot.img-zImage /sdcard/Kernels/anykernel/zImage)"
su -c "(cd /data/local/AIK-mobile/ && ./cleanup.sh)"
su -c rm -rf /data/local/AIK-mobile/boot.img
cd /sdcard/Kernels/anykernel
echo
echo "Enter you desired Kernel Name without space"
read kernel_name
mkdir /sdcard/Kernels/Completed
zip /sdcard/Kernels/Completed/$kernel_name *
rm -rf /sdcard/Kernels/anykernel
echo
echo "Successful! Check Completed folder"
rm -rf $HOME/anykernel

else
echo "Wrong Input"
fi


