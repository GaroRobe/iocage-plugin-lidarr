ln -s /usr/local/bin/mono /usr/bin/mono

fetch https://github.com/lidarr/Lidarr/releases/download/v0.2.0.371/Lidarr.develop.0.2.0.371.linux.tar.gz -o /usr/local/share
tar -xzvf /usr/local/share/Lidarr.develop.*.linux.tar.gz -C /usr/local/share
rm /usr/local/share/Lidarr.*.tar.gz

pw user add lidarr -c lidarr -u 353 -d /nonexistent -s /usr/bin/nologin
mkdir /usr/local/lidarr
chown -R lidarr:lidarr /usr/local/share/Lidarr /usr/local/lidarr

chmod u+x /usr/local/etc/rc.d/lidarr
sysrc "lidarr_enable=YES"
service lidarr start