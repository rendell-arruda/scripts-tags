#!/bin/bash

# Array com os nomes dos secrets que você deseja etiquetar
nomes_secrets=("nome-secret-1" "nome-secret-2" "nome-secret-3")

# Loop para adicionar as tags aos Secrets Manager
for secret in "${nomes_secrets[@]}"; do
    output=$(aws secretsmanager tag-resource --secret-id "$secret" --tags '[{"Key": "Produto", "Value": "infraestrutura"}, {"Key": "Subproduto", "Value": "infraestrutura"}]' 2>&1)

    if [[ $? -eq 0 ]]; then
        echo "Tags adicionadas ao secret $secret"
    else
        echo "Falha ao adicionar tags ao secret $secret: $output"
    fi
done