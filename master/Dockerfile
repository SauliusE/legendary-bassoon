FROM jenkins/jenkins:2.249.2

LABEL maintainer="saulius.eidukas@eficode.com"

ENV JENKINS_HOME /var/jenkins_home

# Add support for proxies.
# Values should be passed as build args
# http://docs.docker.com/engine/reference/builder/#arg
ENV http_proxy ${http_proxy:-}
ENV https_proxy ${https_proxy:-}
ENV no_proxy ${no_proxy:-}
ARG JAVA_PROXY
ENV JAVA_PROXY ${JAVA_PROXY:-}
ARG JAVA_OPTS

ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false -Djenkins.CLI.disabled=true ${JAVA_PROXY:-} -Dorg.apache.commons.jelly.tags.fmt.timeZone=Europe/Stockholm ${JAVA_PROXY:-}"

COPY plugins_extra.txt /usr/share/jenkins/ref/plugins_extra.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins_extra.txt