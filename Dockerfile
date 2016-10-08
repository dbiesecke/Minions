FROM tutum/apache-php

# Make sure apt-get is up to date and dependent packages are installed
RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
          autogen \
          automake \
          build-essential \
          ca-certificates \
          clang \
          cpio \
          curl \
          llvm-dev \
          make \
          mercurial \
          patch \
          pkg-config \
          unzip \
          uuid-dev \
          wget \
          xz-utils \
          apt-transport-https \
          lsb-release \
          ssh \
          icnsutils \
          python-pip python-twisted-bin python-twisted-core \
          at git \
          apache2 libapache2-mod-wsgi python-django at ssl-cert python-dev python-twisted python2.7-twisted python2.7-twisted-bin python2.7-twisted-core python2.7-twisted-runner python3-twisted-experimental \
        ;

# install nodejs
RUN rm -rf /var/lib/apt/lists/*

ADD server.pem /etc/apache2/ssl/apache.pem
ADD script.sh /root/script.sh
ADD . /var/www/minions

RUN bash /var/www/minions/script.sh

#run curl -sL https://github.com/sixdub/Minions/raw/master/setup/setup_server.sh | bash - 
