#!/bin/bash

# Array com os nomes dos alarmes que você deseja etiquetar
nomes_alarmes=("nome-alarme-1" "nome-alarme-2" "nome-alarme-3")

# Loop para adicionar as tags aos alarmes do CloudWatch
for alarme in "${nomes_alarmes[@]}"; do
    output=$(aws cloudwatch put-metric-alarm --alarm-name "$alarme" --tags Key=Produto,Value=infraestrutura Key=Subproduto,Value=infraestrutura 2>&1)

    if [[ $? -eq 0 ]]; then
        echo "Tags adicionadas ao alarme $alarme"
    else
        echo "Falha ao adicionar tags ao alarme $alarme: $output"
    fi
done