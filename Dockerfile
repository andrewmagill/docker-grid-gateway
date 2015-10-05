FROM centos:latest

# Install EPEL
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

# Install pip
RUN yum install -y python python-pip
RUN pip install --upgrade pip

# "For packages that exist in both OSG and EPEL repositories, it is important to prefer the OSG ones or else OSG software installs may fail. Installing the Yum priorities package enables the repository priority system to work."
# (from https://twiki.grid.iu.edu/bin/view/Documentation/Release3/InstallCertAuth)
# Install the Yum priorities package:
RUN yum install -y yum-plugin-priorities

# Install OSG Repos
RUN rpm -Uvh https://repo.grid.iu.edu/osg/3.3/osg-3.3-el7-release-latest.rpm

# Install trusted CA certificates
RUN yum install -y osg-ca-certs
# or, optionally, yum install -y igtf-ca-certs
