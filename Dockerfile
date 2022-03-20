FROM jenkins/jenkins:lts-jdk11
USER root

RUN apt update

# install wget, xvfb & prerequisites
RUN apt install -y wget unzip xvfb libxi6 libgconf-2-4

# install maven
RUN apt install -y maven

# install npm
RUN apt install -y npm

# install newman
RUN npm install -g newman

# Install Chrome
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN bash -c "echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google-chrome.list"
RUN apt -y update
RUN apt -y install google-chrome-stable

RUN wget https://chromedriver.storage.googleapis.com/99.0.4844.51/chromedriver_linux64.zip

RUN unzip chromedriver_linux64.zip

RUN mv chromedriver /usr/bin/chromedriver
RUN chown jenkins:jenkins /usr/bin/chromedriver
RUN chmod +x /usr/bin/chromedriver

# Install Selenium Server
RUN mkdir -p /opt/selenium
RUN wget https://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar
RUN mv selenium-server-standalone-3.141.59.jar /opt/selenium/selenium-server-standalone.jar
RUN chmod +x /opt/selenium/selenium-server-standalone.jar

USER jenkins

# ADD start.sh
COPY start.sh /usr/local/bin
ENTRYPOINT ["/bin/bash"]
CMD ["/usr/local/bin/start.sh"]
