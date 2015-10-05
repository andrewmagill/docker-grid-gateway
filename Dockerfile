FROM centos:latest

# Install EPEL
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

RUN yum update -y

########################
## install python 2.7.10
########################
#
## Install Dependencies
#RUN yum groupinstall -y 'development tools'
#RUN yum install -y zlib-devel bzip2-devel openssl-devel xz-libs wget
#
## Download installer
#RUN wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tar.xz
#RUN xz -d Python-2.7.10.tar.xz
#RUN tar -xvf Python-2.7.10.tar
#RUN cd Python-2.7.10
#
## Build
#RUN ./configure --prefix=/usr/local
#RUN make
#RUN make altinstall
########################

# Install pip
RUN yum install -y python python-pip
RUN pip install --upgrade pip

# Install supervisor
RUN pip install supervisor

# "For packages that exist in both OSG and EPEL repositories, it is important to prefer the OSG ones or else OSG software installs may fail. Installing the Yum priorities package enables the repository priority system to work."
# (from https://twiki.grid.iu.edu/bin/view/Documentation/Release3/InstallCertAuth)
# Install the Yum priorities package:
RUN yum install -y yum-plugin-priorities

# Install OSG Repos
RUN rpm -Uvh https://repo.grid.iu.edu/osg/3.3/osg-3.3-el7-release-latest.rpm

# Install trusted CA certificates
RUN yum install -y osg-ca-certs
# or, optionally, yum install -y igtf-ca-certs
