echo -e "\e[35mDisable Default Nginx\e[0m"
dnf module disable nginx -y

echo -e "\e[35mEnable Nginx 24\e[0m"
dnf module enable nginx:1.24 -y

echo -e "\e[35mInstall Nginx\e[0m"
dnf install nginx -y

echo -e "\e[35mCopy Nginx Config file\e[0m"
cp nginx.conf /etc/nginx/nginx.conf

echo -e "\e[35mClean Old Content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[35mDownload App content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
cd /usr/share/nginx/html

echo -e "\e[35mExtract app content\e[0m"
unzip /tmp/frontend.zip

echo -e "\e[35mStart Nginx Service\e[0m"
systemctl enable nginx
systemctl restart nginx

