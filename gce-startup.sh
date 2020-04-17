# Install Stackdriver logging agent
curl -sSO https://dl.google.com/cloudagents/install-logging-agent.sh
sudo bash install-logging-agent.sh

# Install apt-get enable SSL
sudo apt-get -yq install apt-transport-https

sudo apt-get -yq install git

# Register Microsoft key and feed
wget -O- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget https://packages.microsoft.com/config/debian/9/prod.list
sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list

# Install the .NET Core
sudo apt-get update
# sudo apt-get -yq install dotnet-runtime-3.1
# sudo apt-get -yq install aspnetcore-runtime-3.1
sudo apt-get -yq install dotnet-sdk-3.1

# Install Nginx
sudo apt-get install -yq nginx

# Install cloud_sql_proxy。指定目錄(-O)
wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O /usr/local/bin/cloud_sql_proxy
chmod +x /usr/local/bin/cloud_sql_proxy

# Fetch source code
sudo git clone https://github.com/reddtsai/dotnetLotteryAPI.git /usr/local/api

# Setup cloud_sql_proxy on system service
sudo cp /usr/local/api/cloud-sql-proxy.service /etc/systemd/system/cloud-sql-proxy.service
sudo systemctl enable cloud-sql-proxy.service
sudo systemctl start cloud-sql-proxy.service

# Setup api
/usr/bin/dotnet publish /usr/local/api/src/lotteryapi.csproj -r linux-x64 --self-contained false --configuration Release
sudo cp / /usr/local/api/src/bin/Release/netcoreapp3.1/linux-x64/publish /var/www/LotteryAPI
sudo cp /usr/local/api/lottery-api.service /etc/systemd/system/lottery-api.service
sudo systemctl enable lottery-api.service
sudo systemctl start lottery-api.service

# Setup api on Nginx
sudo rm /etc/nginx/sites-available/default
sudo cp /usr/local/api/nginx-config /etc/nginx/sites-available/default
sudo nginx -s reload