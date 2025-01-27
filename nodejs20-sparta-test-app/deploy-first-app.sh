# first download app folder from SP onto local machine and unzip it off home directory, named as nodejs20-sparta-test-app (aka farah)

sudo apt-get update -y 

sudo apt-get upgrade -y

sudo apt-install nginx -y

# downloading node js 
sudo DEBIAN_FRONTEND=noninteractive bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -" && \
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# from the local machine in git, need to scp or rsync or git clone; should have permissions over this folder. scp method:
# scp -i [ssh path] [folder from home directory of local machine] -r [path to home for VM, made of user @ ip:~]
# note that this takes a while to complete:
scp -i ~/.ssh/tech501-farah-az-key -r nodejs20-sparta-test-app azureuser@20.254.65.158:~

# for script?
cd repo
cd app
npm install # should show 0 vulnerabilities]

npm start # output: your app is ready and listening on port 3000]

# then paste IP address into url bar followed by :3000 to test app is running