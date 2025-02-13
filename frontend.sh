echo Disable Default Nginx
dnf module disable nginx -y

echo Enable Nginx 24
dnf module enable nginx:1.24 -y

echo Install Nginx
dnf install nginx -y

echo Copy Nginx Config file
cp nginx.conf /etc/nginx/nginx.conf

echo Clean Old Content
rm -rf /usr/share/nginx/html/*

echo Download App content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
cd /usr/share/nginx/html

echo Extract app content
unzip /tmp/frontend.zip

echo Start Nginx Service
systemctl enable nginx
systemctl restart nginx

