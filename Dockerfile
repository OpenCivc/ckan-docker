FROM ckan/ckan

# Install git
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y git

# Install the CKAN Spatial extension
RUN $CKAN_HOME/bin/$ pip install -e  git+https://github.com/okfn/ckanext-wordpresser#egg=ckanext-wordpresser

# Add my custom configuration file
ADD mycustomconfig.ini $CKAN_CONFIG/ckan.ini

RUN printf "ckan.plugins = wordpresser\nwordpresser.proxy_host = http://dev-open-housing-asheville.pantheon.io/" >> /etc/ckan/default/ckan.ini