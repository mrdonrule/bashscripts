
if [ -e /var/run/nginx.pid ];

then echo "nginx is running";

else
  echo "ngnix is not running. Restarting..."
        systemctl restart nginx
fi
