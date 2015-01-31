FROM node
MAINTAINER chuck.sakoda@us.imshealth.com

RUN apt-get update
RUN apt-get install ruby -y
RUN apt-get install ruby-all-dev -y
RUN gem install jekyll
RUN pip install mkdocs
RUN npm install -g bower 

ENV GITLAB_URL https://gitlab.imshealth.com
ENV EXT_URL http://localhost

CMD sh bin/config_and_run.sh
EXPOSE 3000

ADD . /GitLab-Pages
WORKDIR GitLab-Pages
RUN ssh-keygen -t rsa -f "keys/id_rsa"
RUN npm install
RUN bower --allow-root install