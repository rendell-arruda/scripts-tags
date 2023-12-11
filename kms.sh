#!/bin/bash

# Arquivo que contém os IDs das chaves do KMS
arquivo_ids="ids_chaves.txt"

# Verifica se o arquivo existe
if [ -f "$arquivo_ids" ]; then
    # Transforma os IDs em uma lista de strings com aspas duplas separadas por espaço
    lista_strings=""
    while IFS= read -r id_chave; do
        lista_strings+="\"$id_chave\" "
    done < "$arquivo_ids"

    # Remove o espaço em branco extra do final, se houver
    lista_strings=${lista_strings%" "}

    echo "Lista de strings com aspas duplas:"
    echo "$lista_strings"

    # Loop para adicionar as tags às chaves do KMS
    for id_chave in $lista_strings; do
        output=$(aws kms tag-resource --key-id "$id_chave" --tags TagKey1=ValorTag1 TagKey2=ValorTag2 2>&1)

        if [[ $? -eq 0 ]]; then
            echo "Tags adicionadas à chave do KMS $id_chave"
        else
            echo "Falha ao adicionar tags à chave do KMS $id_chave: $output"
        fi
    done
else
    echo "O arquivo $arquivo_ids não foi encontrado."
fi