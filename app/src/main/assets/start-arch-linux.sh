#!/system/bin/sh

# إعداد المسارات
APP_DATA="/data/data/com.termux.linuxal/files"
PROOT_PATH="$APP_DATA/proot"
LIBEXEC_PATH="$APP_DATA/libexec"
ARCH_ROOT="$APP_DATA/archlinux"

# إنشاء المجلدات إذا لم توجد
mkdir -p "$ARCH_ROOT"

# نسخ proot والمكتبات إذا لم تكن موجودة
if [ ! -f "$PROOT_PATH" ]; then
    cp "$APP_DATA/bin/proot" "$PROOT_PATH"
    chmod 755 "$PROOT_PATH"
fi

if [ ! -d "$LIBEXEC_PATH" ]; then
    cp -r "$APP_DATA/bin/libexec" "$LIBEXEC_PATH"
fi

# تعيين مسار المكتبات
export PROOT_LIBEXEC="$LIBEXEC_PATH"

# تشغيل Arch Linux
echo "🚀 Starting Arch Linux..."
echo "📂 Rootfs: $ARCH_ROOT"

exec "$PROOT_PATH" \
    --rootfs="$ARCH_ROOT" \
    --link2symlink \
    --kill-on-exit \
    --bind=/system:/system \
    --bind=/dev:/dev \
    --bind=/proc:/proc \
    --bind=/sys:/sys \
    --bind=/sdcard:/sdcard \
    --bind=/storage:/storage \
    --bind=/data:/host-data \
    /bin/bash
