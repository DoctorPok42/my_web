sudo apt update
sudo apt install nginx

sudo mkdir -p /var/www/intra.asrlab.lan/html
sudo chmod -R 755 /var/www/intra.asrlab.lan

sudo mkdir -p /var/www/intra-adm.asrlab.lan/html
sudo chmod -R 755 /var/www/intra-adm.asrlab.lan

sudo nano /etc/nginx/sites-available/intra.asrlab.lan

server {
    listen 81;
    listen [::]:81;

    root /var/www/intra.asrlab.lan/html;
    index index.html index.htm index.nginx-debian.html;

    server_name intra.asrlab.lan www.intra.asrlab.lan;

    location / {
        try_files $uri $uri/ =404;
    }
}

sudo nano /etc/nginx/sites-available/intra-adm.asrlab.lan

server {
    listen 82;
    listen [::]:82;

    root /var/www/intra-adm.asrlab.lan/html;
    index index.html index.htm index.nginx-debian.html;

    server_name intra-adm.asrlab.lan www.intra-adm.asrlab.lan;

    location / {
        try_files $uri $uri/ =404;
    }
}

sudo ln -s /etc/nginx/sites-available/intra.asrlab.lan /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/intra-adm.asrlab.lan /etc/nginx/sites-enabled/

sudo systemctl restart nginx