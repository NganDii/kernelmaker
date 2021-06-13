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

echo -e "\n\n\e[91mCopy your boot.img to Sdcard/Kernels"
echo -e "\e[92mPress y to continue\e[0m"
read r
if [ $r == "y" ]; then
su -c "rm -rf $aik/boot.img" > /dev/null 2>&1
su -c mv /sdcard/Kernels/*.img /sdcard/Kernels/boot.img
su -c mv -f /sdcard/Kernels/boot.img ${aik}/boot.img
su -c "(cd ${aik} && ./unpackimg.sh)"
if [ -e "${aik}/split_img/boot.img-zImage" ]; then
  su -c "(mv  -f ${aik}/split_img/boot.img-zImage /sdcard/Kernels/anykernel/zImage)"
else
  su -c "(mv  -f ${aik}/split_img/boot.img-kernel /sdcard/Kernels/anykernel/zImage)"
fi
su -c "(cd ${aik} && ./cleanup.sh)"
su -c rm -rf ${aik}/boot.img
cd /sdcard/Kernels/anykernel
echo
echo -n "Enter you desired Kernel Name without space: "
read kernel_name
mkdir -p /sdcard/Kernels/Completed
zip -r -0 "$kernel_name".zip *
mv "$kernel_name".zip /sdcard/Kernels/Completed/
rm -rf /sdcard/Kernels/anykernel
echo
echo "Successful! Check Completed folder"
rm -rf $HOME/anykernel

else
echo -e "Please run it again after you are ready\n"
fi


