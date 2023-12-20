#!/bin/bash

# Definir o nome do usuário
user="superuser"

# Diretório raiz do projeto
project_dir="/home/$user/projects/"

# Criar diretório do projeto se não existir
mkdir -p "$project_dir"

# Criar estrutura de pastas
mkdir -p "$project_dir/app"
mkdir -p "$project_dir/k8s"
mkdir -p "$project_dir/scripts"

# Criar arquivos dentro dos diretórios
touch "$project_dir/README.md"
touch "$project_dir/app/Dockerfile"
touch "$project_dir/k8s/deployment.yaml"
touch "$project_dir/k8s/service.yaml"
touch "$project_dir/scripts/deploy.sh"

# Dar permissões ao usuário no diretório
chown -R $user:$user "$project_dir"

echo "Estrutura de pasta criada com sucesso em $project_dir"

