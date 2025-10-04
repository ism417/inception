#! /bin/sh

# Add FTP user if it does not exist
if id "${FTP_USER}" >/dev/null 2>&1; then
    echo "User already exists"
else
    useradd ${FTP_USER}
    echo "${FTP_USER}:${FTP_PASS}" | chpasswd
fi

# Configure vsftpd
sed -i "s|#write_enable=YES|write_enable=YES|g" /etc/vsftpd.conf
sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g" /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "local_enable=YES" >> /etc/vsftpd.conf

# Set proper ownership and permissions
chown -R ${FTP_USER}:${FTP_USER} /var/www/wordpress
chmod -R 755 /var/www/wordpress

mkdir -p /var/run/vsftpd/empty
usermod -d /var/www/wordpress ${FTP_USER}

exec "$@"