FROM node:11.10.1-slim

RUN apt-get -y update \
	&& apt-get install -y git

RUN npm install -g vue-cli
RUN npm install -g quasar-cli

WORKDIR /app

RUN apt-get autoremove -y \
    && apt-get autoclean -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Or just use EXPORT 8080
EXPOSE 8080
# If yout want use vue-cli UI you need to also EXPORT 8000 

USER node

# switch to npm if you chose it as package manager
#CMD ["quasar", "dev"]
