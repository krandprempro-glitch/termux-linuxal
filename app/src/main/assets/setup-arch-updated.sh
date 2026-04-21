#!/system/bin/sh

APP_DATA="/data/data/com.termux.linuxal/files"
echo "📦 Setting up Arch Linux with proot..."

# نسخ ملفات proot
cp -r "$APP_DATA/bin" "$APP_DATA/proot-files"
chmod +x "$APP_DATA/proot-files/proot"

# تنزيل Arch Linux rootfs إذا لم يكن موجوداً
if [ ! -f "$APP_DATA/archlinux/rootfs.tar.gz" ]; then
    echo "📥 Downloading Arch Linux rootfs (~500MB)..."
    mkdir -p "$APP_DATA/archlinux"
    cd "$APP_DATA/archlinux"
    wget https://mirror.rackspace.com/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.gz
    tar -xzf archlinux-bootstrap-x86_64.tar.gz
    mv root.x86_64/* ./
fi

echo "✅ Setup complete!"
echo "Run start-arch-linux.sh to start Arch Linux"
