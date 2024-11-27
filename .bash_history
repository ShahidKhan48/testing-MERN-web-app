clear
yum update -y
yum install docker -y
yum install docker-compose -y
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version
systemctl start docker
systemctl enable docker
yum install git -y
clear
yum install nginx -y
clear
git clone https://github.com/AndreJackBia/JobPortal.git
ls
cd JobPortal
ls
cd docker
ls
docker-compose up -d
nano docker-compose.yml
vim docker-compose.yml
docker-compose up -d
ls
mkdir mern-app
cd mern-app
git clone https://github.com/b30wulffz/job-portal.git
ls
cd job-portal
ls
cd backend
ls
nano Dockerfile
ls
cd ..
ls
cd frontend
ls
nano Dockerfile
cd ..
ls
mkdir nginx
cd nginx
ls
nano default.conf
cd ..
ls
nano docker-compose.yml
docker-compose up --build -d
cd frontend
rm -rf node_modules package-lock.json
npm install
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs
node -v
npm -v
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
source ~/.bashrc
npm install
npm run build
ls
nano Dockerfile
cd ..
docker-compose up --build -d
