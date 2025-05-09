#! /bin/bash
# Install the latest version of Python3
#
#

#ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
#DEBIAN_FRONTEND=noninteractive 

# Install wget, gcc, and other build tools
#apt update
#apt install -y tzdata
#dpkg-reconfigure --frontend noninteractive tzdata

#apt install -y wget build-essential pkg-config

# download Python3 file
#wget -P /tmp https://www.python.org/ftp/python/3.12.9/Python-3.12.9.tgz

# extract compressed Python file
#tar -xvzf /tmp/https://www.python.org/ftp/python/3.12.9/Python-3.12.9.tgz --directory=/tmp

# compile and install
#/tmp/Python-3.12.9/configure --enable-optimizations
#make bininstall

#./configure
#    make
#    make test
#    sudo make install

#ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
#DEBIAN_FRONTEND=noninteractive

#apt update && apt install -y tzdata
#dpkg-reconfigure --frontend noninteractive tzdata

#apt install -y wget build-essential libreadline-dev libncursesw5-dev \
 # libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev \
 # libffi-dev zlib1g-dev

#cd /home/
#wget -c https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tar.xz
#tar -Jxf Python-3.11.0.tar.xz
#cd Python-3.11.0
#./configure --enable-optimizations
#make -j4 &&  make altinstall
#update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.11 100
#ln -sf /usr/bin/python3.11 /usr/bin/python3
#echo "Done"





ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
DEBIAN_FRONTEND=noninteractive

apt update
apt install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata

# Install essential build dependencies *FIRST* (including wget)
apt install -y wget build-essential libreadline-dev libncursesw5-dev \
    libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev \
    libffi-dev zlib1g-dev

# Download and install Python *BEFORE* installing python3-apt
cd /home/
wget -c https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tar.xz
tar -Jxf Python-3.11.0.tar.xz
cd Python-3.11.0
./configure --enable-optimizations
make -j$(nproc)  # Use all available cores for faster compilation
make altinstall

update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.11 100
ln -sf /usr/local/bin/python3.11 /usr/bin/python3 # Correct the symlink target

# *NOW* install python3-apt (after Python is installed)
apt install -y python3-apt

echo "Done"
