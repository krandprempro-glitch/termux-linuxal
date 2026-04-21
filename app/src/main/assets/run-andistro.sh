#!/system/bin/sh
# هذا السكريبت سيعمل داخل تطبيق LinuxAL لتشغيل مثبت Andistro

echo "=========================================="
echo "🐧 LinuxAL - مشغل Andistro"
echo "=========================================="
echo "📡 جاري الاتصال بـ GitHub لتحميل أحدث مثبت..."
echo ""

# هذا هو الأمر الذي طلبت تنفيذه بالضبط
curl -L "https://github.com/andistro/installer/releases/latest/download/andistro_setup" | bash

# تحقق من نتيجة التنفيذ
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ انتهى تشغيل Andistro بنجاح."
else
    echo ""
    echo "❌ حدث خطأ أثناء التشغيل. يرجى التحقق من اتصال الإنترنت."
fi
