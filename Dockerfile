FROM node
MAINTAINER chuck.sakoda@us.imshealth.com

RUN apt-get update
RUN apt-get install ruby -y
RUN apt-get install ruby-all-dev -y
RUN gem install jekyll
RUN apt-get install python-pip -y
RUN apt-get install python-dev -y
RUN pip install mkdocs
RUN npm install -g bower 

ENV GITLAB_URL https://gitlab.imshealth.com
ENV EXT_URL http://localhost

CMD sh bin/config_and_run.sh
EXPOSE 3000

ADD . /GitLab-Pages
WORKDIR GitLab-Pages
RUN npm install
RUN bower --allow-root install
