aik=/data/local/AIK-mobile
echo "KERNEL MAKER"
rm -rf ~/anykernel
rm -rf /sdcard/Kernels/anykernel
test ! -d /sdcard/Kernels && mkdir -p /sdcard/Kernels
mkdir /sdcard/Kernels/anykernel
cd ~/
git clone https://github.com/NganDii/anykernel
mv -f $HOME/anykernel/anykernel.zip /sdcard/Kernels/anykernel
cd /sdcard/Kernels/anykernel



unzip /sdcard/Kernels/anykernel/anykernel.zip && rm anykernel.zip

echo "Copy your boot.img to Sdcard/Kernels"
echo "Press y to continue"
read r
if [ $r == "y" ]; then
su -c "rm -rf $aik/boot.img"
su -c mv -f /sdcard/Kernels/boot.img $aik
su -c "(cd $aik && ./unpackimg.sh)"
su -c "(mv  -f $aik/split_img/boot.img-zImage /sdcard/Kernels/anykernel/zImage)"
su -c "(cd $aik && ./cleanup.sh)"
su -c rm -rf $aik/boot.img
cd /sdcard/Kernels/anykernel
echo
echo "Enter you desired Kernel Name without space"
read kernel_name
test ! -d /sdcard/Kernels/Completed && mkdir /sdcard/Kernels/Completed
zip -r -0 "$kernel_name".zip *
mv "$kernel_name".zip /sdcard/Kernels/Completed/
rm -rf /sdcard/Kernels/anykernel
echo
echo "Successful! Check Completed folder"
rm -rf $HOME/anykernel

else
echo "Wrong Input"
fi


