# install
sudo npm install pm2 -g

pm2 start app.js --name ${app_name}

pm2 list

pm2 logs ${app_name}
pm2 delete ${app_name}
