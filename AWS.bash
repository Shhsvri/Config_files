sudo apt update
sudo apt upgrade

sudo fdisk /dev/nvme1n1

# PubKey -> No
# PasswordAuthen -> Yes

# Copy students.tsv and add new users
while read user pass; do sudo useradd -m $user; printf '%s:%s' $user $pass | sudo chpasswd ; done <students.tsv

sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo apt update
sudo apt install r-base r-base-core r-recommended r-base-dev g++ libcurl4-openssl-dev libssl-dev libxml2-dev gdebi-core
sudo apt upgrade

# partition /dev/nvme1n{1,2}
mkfs.ext4

# Change permissions for files
sudo find . -type f -print0 | xargs -0 sudo chmod 640



# Install Rstudio Server
sudo apt-get install gdebi-core
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1093-amd64.deb
sudo gdebi rstudio-server-1.3.1093-amd64.deb

install datasets
RColorBewer
tidyverse

# R_Course
while read user pass; do sudo mkdir -p /home/$user/{Day1,Day2,Day3,Day4}/{archive,datasets,output/{data,visualizations},R_scripts}; done <students.tsv
while read user pass; do sudo chown -R $user:$user /home/$user; done <students.tsv
