FROM node:10.15.2

# Run this from evmc-js dir
RUN mkdir -p /home/node/evmc-js && chown -R node:node /home/node/evmc-js

# Install cmake
ADD https://cmake.org/files/v3.13/cmake-3.13.4-Linux-x86_64.sh /cmake-3.13.4-Linux-x86_64.sh
RUN mkdir /opt/cmake
RUN sh /cmake-3.13.4-Linux-x86_64.sh --prefix=/opt/cmake --skip-license
RUN ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
RUN cmake --version

WORKDIR /home/node/evmc-js

COPY package*.json ./

USER node
COPY --chown=node:node . .
RUN ls -al
RUN npm install typescript@^3.2
RUN npm i
RUN npm install net
RUN npm run compile

EXPOSE 8080

CMD [ "node", "hello.js" ]