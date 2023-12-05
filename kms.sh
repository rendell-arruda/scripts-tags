#!/bin/bash

# Array com os IDs das chaves do KMS que você deseja etiquetar
ids_chaves_kms=("id-chave-kms-1" "id-chave-kms-2" "id-chave-kms-3")

# Loop para adicionar as tags às chaves do KMS
for id_chave in "${ids_chaves_kms[@]}"; do
    output=$(aws kms tag-resource --key-id "$id_chave" --tags TagKey1=ValorTag1 TagKey2=ValorTag2 2>&1)

    if [[ $? -eq 0 ]]; then
        echo "Tags adicionadas à chave do KMS $id_chave"
    else
        echo "Falha ao adicionar tags à chave do KMS $id_chave: $output"
    fi
done
