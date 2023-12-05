#!/bin/bash

# Array com os nomes dos secrets que você deseja etiquetar
nomes_secrets=("nome-secret-1" "nome-secret-2" "nome-secret-3")

# Loop para adicionar as tags aos Secrets Manager
for secret in "${nomes_secrets[@]}"; do
    aws secretsmanager tag-resource \
    --secret-id "$secret" \
    --tags '[{"Key": "Produto", "Value": "infraestrutura"}, {"Key": "Subproduto", "Value": "infraestrutura"}]'
    echo "Tags adicionadas ao secret $secret"
done
