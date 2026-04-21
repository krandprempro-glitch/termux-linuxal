#!/system/bin/sh
echo "📱 LinuxAL - القائمة الرئيسية"
echo "1) تشغيل Andistro وتثبيت Arch Linux"
echo "2) تشغيل Linux المثبت مسبقاً"
echo ""
echo -n "اختر (1 أو 2): "
read choice

if [ "$choice" = "1" ]; then
    echo "🚀 جارٍ تشغيل Andistro..."
    bash /data/data/com.termux.linuxal/files/run-andistro.sh
elif [ "$choice" = "2" ]; then
    echo "🔧 جارٍ تشغيل البيئة المثبتة..."
    # أضف هنا أمر تشغيل البيئة التي قمت بتثبيتها مسبقاً
    # مثلاً: proot-distro login archlinux
else
    echo "❌ اختيار غير صالح"
fi
