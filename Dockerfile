# Use a imagem oficial Node.js LTS
FROM node:14

# Crie e defina o diretório de trabalho
WORKDIR /usr/src/app

# Copie o arquivo package.json e yarn.lock para o diretório de trabalho
COPY package.json yarn.lock ./

# Instale as dependências usando yarn
RUN yarn install

# Copie os arquivos de origem (aplicação)
COPY . .

# Compile o código TypeScript
RUN yarn build

# Exponha a porta em que a aplicação será executada
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["yarn", "start"]

