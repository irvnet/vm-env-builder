
# update everything
sudo apt-get update
sudo apt-get -y upgrade

# install ubuntu desktop
echo "INSTALLING UBUNTU DESKTOP..."
sudo apt-get install -y ubuntu-desktop
sudo apt-get update -y
sudo apt-get upgrade -y

# install vmware tools
echo "INSTALLING VMWARE TOOLS..."
mkdir -p /mnt/vmw-tools && mount /dev/cdrom /mnt/vmw-tools && VMW_TOOLS=$(ls /mnt/vmw-tools/ | grep .gz) && cp -f /mnt/vmw-tools/${VMW_TOOLS} /tmp/ && umount /mnt/vmw-tools && rmdir /mnt/vmw-tools && tar -zxvf /tmp/${VMW_TOOLS} -C /tmp/ && cd /tmp/vmware-tools-distrib/ && ./vmware-install.pl -d default && rm -rf vmware-tools-distrib/ && rm -f /tmp/${VMW_TOOLS} && cd ~

# install linux headers
echo "INSTALLING LINUX HEADERS..."
sudo apt-get -y install linux-headers-$(uname -r)

# install archive managers
echo "INSTALLING ARCHIVE MANAGERS..."
sudo apt-get install -y unrar rar zip unzip 

# install git
echo "INSTALLING GIT..."
sudo apt-get install -y git

# install java
echo "INSTALLING JAVA..."
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update 
sudo apt-get install -y openjdk-8-jdk

# install salt
echo "INSTALLING SALT..."
wget -O - https://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
sudo sh -c "echo 'deb http://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest trusty main' >> /etc/apt/sources.list"
sudo apt-get update
sudo apt-get install -y salt-master salt-minion salt-ssh salt-syndic salt-cloud

# install docker 1.8 (pre-req for bluemix ic plugin)
echo "INSTALLING DOCKER..."
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' >> /etc/apt/sources.list.d/docker.list"
sudo apt-get update -y
sudo apt-get purge lxc-docker
sudo apt-get install -y docker-engine

# install vagrant
echo "INSTALLING VAGRANT..."
sudo apt-get install -y vagrant

# add users to sudoers
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers
echo "UseDNS no" >> /etc/ssh/sshd_config

# install ubuntu desktop
echo "INSTALLING DESKTOP..."
sudo apt-get install -y ubuntu-desktop
apt-get update -y
apt-get upgrade 

