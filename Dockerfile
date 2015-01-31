FROM node
MAINTAINER chuck.sakoda@us.imshealth.com

RUN apt-get update
RUN apt-get install ruby -y
RUN apt-get install ruby-all-dev -y
RUN gem install jekyll
RUN npm install -g bower 
ADD . /GitLab-Pages
WORKDIR GitLab-Pages
RUN npm install
RUN bower --allow-root install
ENV GITLAB_URL https://gitlab.imshealth.com
ENV EXT_URL http://localhost

RUN ssh-keygen -t rsa -f "keys/id_rsa"
CMD sh bin/config_and_run.sh
EXPOSE 3000


