#!bin/bash
xvfb-run java -Dwebdriver.chrome.driver=/usr/bin/chromedriver -jar /opt/selenium/selenium-server-standalone.jar &>/dev/null &
/sbin/tini -- /usr/local/bin/jenkins.sh