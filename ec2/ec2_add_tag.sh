#!/bin/bash

# Arquivo que contém os IDs das instâncias EC2
arquivo_ids="./ids_ec2.txt"

# Verifica se o arquivo de IDs existe
if [ -f "$arquivo_ids" ]; then

    # Exibir a lista de IDs de instâncias EC2 no arquivo
    # echo "Lista de IDs de instâncias EC2 no arquivo:"
    # cat "$arquivo_ids"

    # Variável para armazenar IDs das instâncias EC2 que não puderam ser tagueadas
    instancias_falha=""

    # Loop para adicionar as tags às instâncias EC2
    while IFS= read -r id_ec2 || [[ -n $id_ec2 ]]; do
        output=$(aws ec2 create-tags --resources "$id_ec2" --tags Key=Produto,Value=infraestrutura Key=Subproduto,Value=infra Key=finops.subproduto,Value=infra2 2>&1)

        if [[ $? -eq 0 ]]; then
            echo "Tags adicionadas à instância EC2 $id_ec2"
        else
            echo "Falha ao adicionar tags à instância EC2 $id_ec2: $output"
            instancias_falha+=" $id_ec2"
        fi
    done < "$arquivo_ids"

    # Mostra os IDs das instâncias EC2 que não puderam ser tagueadas
    if [ -n "$instancias_falha" ]; then
        echo " "
        echo "Resultado:"
        echo "Instâncias EC2 que não conseguiram ser tagueadas: $instancias_falha"
    else
        echo "Todas as instâncias EC2 foram tagueadas com sucesso."
    fi
else
    echo "O arquivo $arquivo_ids não foi encontrado."
fi
