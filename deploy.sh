#!/bin/bash

sudo usermod -aG docker ubuntu

git clone https://github.com/mohitwasnik132/node_app.git

cd node_app/

sudo apt install toilet -y >> /dev/null 2>&1

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt install nodejs -y

sudo apt install npm -y

npm install --save express
#npm run start


clear
printf "\nHeading into container give image name, ports, container name as prompted"
printf "\n\n"

#name = "container name"

read -p "Enter image name:           " i_name
printf "\n\n"

printf "assign ports p1:p2"

read -p "Enter docker unmapped host port p1:             " p1
# read -p "Enter docker container port p2:        " p2

printf "\n\nyour tcp port $p1 of docker host is assigned to port 3000 of container\n\n"

docker build -t "$i_name" .
printf "\n\n\n"
#name = "container name"
read -p "Enter container name:        " name
printf "\n\n\n"
clear
docker container stop "$name" >> /dev/null 2>&1
docker rm "$name" >> /dev/null 2>&1
sleep 1
clear
toilet -f pagga -F metal "Ready!!!!"

printf "\n\n"
echo "$(date '+%D %T' | toilet -f term -F border --gay)"
toilet -f pagga -F border:gay  "be lazy!!!"



printf "  your container >> $name << should be  running on docker image $i_name on ports $p1:$p2. Goodluck! \n\n"
docker container run -d  --name "$name"  -p $p1:3000 "$i_name"

pubdns=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)

printf "\nyou can check your containerized app  at \n $pubdns:$p1 \n copy and run above line in a browser"
