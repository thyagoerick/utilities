#!/bin/bash

# Author: Thyago Erick
# Date: 23/01/2024 

# Execute no terminal: chmod 777 removeAllNodeModules.sh
# Após isso para efetuar as remoções execute no terminal: ./removeAllNodeModules.sh

# Função para remover node_modules em um diretório
remove_node_modules() {
    local dir="$1"

    # Verifica se a pasta node_modules existe no diretório
    if [ -d "$dir/node_modules" ]; then
        echo "Removendo $dir/node_modules..."
        # Remove a pasta node_modules
        rm -rf "$dir/node_modules"
        echo "Pasta $dir/node_modules removida."
    fi

    # Itera sobre os subdiretórios
    for file in "$dir"/*; do
        # Se for um diretório, chama a função recursivamente
        if [ -d "$file" ]; then
            remove_node_modules "$file"
        fi
    done
}

# Caminho do diretório raiz
root_directory="/caminhoAbsoluto" # Substitua pelo caminho do seu diretório (esse caminho deve levar para a árvore que pode conter pastas node_modules)

# Chamada da função para remover node_modules
remove_node_modules "$root_directory"

echo "Remoção concluída! ;-)"
