print_head() {
  echo -e "\e[36m$*\e[0m"
}

print_head Disable Default Nginx
dnf module disable nginx -y >/tmp/roboshop.log

print_head Enable Nginx 24
dnf module enable nginx:1.24 -y >/tmp/roboshop.log

print_head Install Nginx
dnf install nginx -y >/tmp/roboshop.log

print_head Copy Nginx Config file
cp nginx.conf /etc/nginx/nginx.conf >/tmp/roboshop.log

print_head Clean Old Content
rm -rf /usr/share/nginx/html/* >/tmp/roboshop.log

print_head Download App content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip >/tmp/roboshop.log
cd /usr/share/nginx/html

print_head Extract app content
unzip /tmp/frontend.zip >/tmp/roboshop.log

print_head Start Nginx Service
systemctl enable nginx >/tmp/roboshop.log
systemctl restart nginx >/tmp/roboshop.log


