# Docker OWASP zed Attack proxy repo

This is the Git repo for the Accenture DevOps Platform owasp_zap docker image.

# What is OWASP Zed Atack Proxy?

The Zed Attack Proxy (ZAP) is an easy to use integrated penetration testing tool for finding vulnerabilities in web applications.
It is designed to be used by people with a wide range of security experience and as such is ideal for developers and functional testers who are new to penetration testing.
ZAP provides automated scanners as well as a set of tools that allow you to find security vulnerabilities manually.

This image can be used to start the ZAP proxy in intercepting mode. For example, you could route your selenium integrations tests through the proxy and get ZAP scan all traffic for vulnerabilities/issues.
The image can also be used to generate a vulnrability report of ZAp scans.

> [owasp/zap](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project)

![logo](https://www.owasp.org/images/1/11/Zap128x128.png)

# How to use this image

## Starting ZAP in intercepting mode
  docker run -td -v /data/:/opt/zaproxy/test-results/ --name owasp__zap_petclinic -p 9090:9090 Accenture/owasp_zap_proxy /etc/init.d/zaproxy start test-${BUILD_NUMBER}

## Generating ZAP Reports
  docker run -i -v /data/:/opt/zaproxy/test-results/ Accenture/owasp_zap_proxy /etc/init.d/zaproxy stop test-${BUILD_NUMBER}
