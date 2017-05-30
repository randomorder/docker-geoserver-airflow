FROM geosolutionsit/tomcat-geoserver:7.0-jre8
MAINTAINER Alessandro Parma<alessandro.parma@geo-solutions.it>

# Install updates
RUN apt-get -y update

#------------- Copy resources from local file system --------------------------
ADD resources /tmp/resources

#------------- Install Utilities ----------------------------------------------
ARG INSTALL_UTILS=false
RUN if [ "$INSTALL_UTILS" = true ]; then \
        apt-get -y install vim zip unzip net-tools curl wget lynx lsof tree postgresql-client \
    ; fi

#------------- Cleanup --------------------------------------------------------

WORKDIR $CATALINA_HOME

ENV TERM xterm

EXPOSE 8080
