# Dockerfile for OWASP Zed Attack Proxy
# https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project
# Installs OWASP ZAP as an intercepting proxy
#
FROM java:7
MAINTAINER Robert Northard, <robert.a.northard@accenture.com>

RUN \
	apt-get update -y && \
	apt-get install -y tar


ENV ZAP_HOME /opt/zaproxy
ENV ZAP_VERSION 2.4.3
# Install OWASP ZAP
RUN \
        wget https://github.com/zaproxy/zaproxy/releases/download/2.4.3/ZAP_2.4.3_Linux.tar.gz && \
	mkdir $ZAP_HOME && \
	mkdir $ZAP_HOME/logs && \
	mkdir $ZAP_HOME/test-results && \
	tar -xf ZAP_2.4.3_Linux.tar.gz -C $ZAP_HOME --strip-components=1 && \
	rm -rf ZAP_2.4.3_Linux.tar.gz

ADD resources/zaproxy /etc/init.d/zaproxy
RUN chmod +x /etc/init.d/zaproxy

# Expose test results/sessions
VOLUME	   ["$ZAP_HOME/test-results"]

# Expose ports
EXPOSE 9090

# Default entry point
ENTRYPOINT ["service", "zaproxy"]
