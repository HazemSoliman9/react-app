FROM node:alpine3.19

WORKDIR /react-app/

COPY . .

RUN npm install

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]