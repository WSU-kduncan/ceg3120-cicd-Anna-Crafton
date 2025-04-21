FROM node:alpine
WORKDIR angular-site/wsu-hw-ng-main
COPY . /usr/src/app
RUN npm install -g @angular/cli
CMD ["ng", "serve", "--host", "0.0.0.0"] 
