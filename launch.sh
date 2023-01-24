sudo apt update
sudo apt install nginx

sudo mkdir -p /var/www/intra.asrlab.lan/html
sudo chmod -R 755 /var/www/intra.asrlab.lan

sudo mkdir -p /var/www/intra-adm.asrlab.lan/html
sudo chmod -R 755 /var/www/intra-adm.asrlab.lan

sudo nano /etc/nginx/sites-available/intra.asrlab.lan

curl https://raw.githubusercontent.com/DoctorPok42/my_web/develop/nginx/intra.asrlab.lan >> /etc/nginx/sites-available/intra.asrlab.lan
curl https://raw.githubusercontent.com/DoctorPok42/my_web/develop/nginx/intra-adm.asrlab.lan >> /etc/nginx/sites-available/intra-adm.asrlab.lan

sudo ln -s /etc/nginx/sites-available/intra.asrlab.lan /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/intra-adm.asrlab.lan /etc/nginx/sites-enabled/

sudo systemctl restart nginx