#!/bin/bash -x

proxy=
export http_proxy=http://${proxy}:8080
export https_proxy=http://${proxy}:8080
export no_proxy=localhost,127.0.0.1,.volvo.net

# To be added to JAVA_OPTS when building images
JAVA_PROXY="-Dhttp.proxyHost=${proxy} -Dhttp.proxyPort=8080"
JAVA_PROXY="$JAVA_PROXY -Dhttps.proxyHost=${proxy} -Dhttps.proxyPort=8080"
JAVA_PROXY="$JAVA_PROXY -Dhttp.nonProxyHosts=localhost|127.0.0.1|jenkins"
export JAVA_PROXY
echo "Building Image"

docker build .  -t pwt/jenkins:latest --build-arg http_proxy --build-arg https_proxy --build-arg no_proxy --build-arg JAVA_PROXY
