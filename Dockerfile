
# Build:
#    docker build -t redeagleeye/catalyst-final:0.5.18.CUSTOM_1.17.113.CUSTOM .
#
# Run:
#    docker run -v /some/folder:/app -v ~/.catalyst:/root/.catalyst --name catalyst-final -it enigmampc/catalyst-final
#
# Exec:
#    docker exec -it catalyst-final catalyst run -f /projects/my_algo.py --start 2015-1-1 --end 2016-1-1 /projects/result.pickle

FROM redeagleeye/catalyst-prod:0.5.18.CUSTOM

ADD python /ccxt/python
ADD package.json /ccxt/package.json
RUN pip install -e /ccxt/python # probably we should change this to a proper build



# ============================== OFFICIAL VERSION =============================================
#
# FROM ubuntu:18.04
#
# # Supresses unwanted user interaction (like "Please select the geographic area" when installing tzdata)
# ENV DEBIAN_FRONTEND=noninteractive
#
# # Update packages (use us.archive.ubuntu.com instead of archive.ubuntu.com — solves the painfully slow apt-get update)
# RUN sed -i 's/archive\.ubuntu\.com/us\.archive\.ubuntu\.com/' /etc/apt/sources.list
# RUN apt-get update
#
# # Miscellaneous deps
# RUN apt-get -y install curl gnupg git pandoc
#
# # PHP
# RUN apt-get install -y php php-curl php-iconv php-mbstring php-bcmath
#
# # Node
# RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
# RUN apt-get -y install nodejs
#
# # Python 2
# RUN apt-get install -y python-pip
# RUN pip2 install --upgrade setuptools requests[security]
#
# # Python 3
# RUN apt-get install -y python3 python3-pip
# RUN pip3 install --upgrade six setuptools wheel pyopenssl tox twine
#
# # Copy files to workdir to run install scripts against it (will be replaced with a live-mounted volume at startup)
# RUN mkdir -p /ccxt
# WORKDIR /ccxt
# ADD . /ccxt
# RUN rm -rf /ccxt/node_modules
#
# # Installs as a local Node & Python module, so that `require ('ccxt')` and `import ccxt` should work after that
# RUN npm install
# RUN ln -s /ccxt /usr/lib/node_modules/
# RUN echo "export NODE_PATH=/usr/lib/node_modules" >> $HOME/.bashrc
# RUN cd python && python3 setup.py install && python setup.py install && cd ..