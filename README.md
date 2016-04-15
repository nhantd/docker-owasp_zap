#Supported tags and respective Dockerfile links

- [`0.1.0`, `0.1.0` (*0.1.0/Dockerfile*)](Dockerfile.md)

# What is adop-owasp_zap?

adop-owasp_zap is a wrapper for the OWASP ZAP image. It has primarily been built to perform security test.
OWASP Zed Attack Proxy (ZAP) is an easy to use integrated penetration testing tool for finding vulnerabilities in web applications.

> [owasp/zap](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project)

![logo](https://www.owasp.org/images/1/11/Zap128x128.png)

# How to use this image
This image can be used to start the ZAP proxy in intercepting mode. For example, you could route your selenium integrations tests through the proxy and get ZAP scan all traffic for vulnerabilities/issues.
The image can also be used to generate a vulnrability report of ZAp scans.

## Starting ZAP in intercepting mode
```
docker run -td -v <LOCAL-MACHINE-REPO>:/opt/zaproxy/test-results/ --name <YOUR-CONTAINER-NAME> -p 9090:9090 Accenture/adop-owasp_zap:<VERSION> start <TEST-NAME>
```
Example:
```
  docker run -td -v /data/:/opt/zaproxy/test-results/ --name owasp__zap_sampletest -p 9090:9090 Accenture/adop-owasp_zap /etc/init.d/zaproxy start test-1
```
## Generating ZAP Reports
To generate HTML report:
```
docker run -i -v <LOCAL-MACHINE-REPO>:/opt/zaproxy/test-results/ Accenture/adop-owasp_zap:<VERSION> stop <TEST-NAME>
```
Example:
```
docker run -i -v /data/:/opt/zaproxy/test-results/ Accenture/adop-owasp_zap stop test-1
```
The report will be generated in docker repor /opt/zaproxy/test-results/, and file name is <TEST-NAME>-report.html
