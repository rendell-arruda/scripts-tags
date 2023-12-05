#!/bin/bash

# Array com os nomes dos grupos de log que você deseja etiquetar
nomes_log_groups=("log-group-taguear" "log-group-taguear2")

# Loop para adicionar as tags aos grupos de log do CloudWatch
for log_group in "${nomes_log_groups[@]}"; do
    output=$(aws logs tag-log-group --log-group-name "$log_group" --tags Produto=infra2,Subproduto=infra2 2>&1)

    if [[ $? -eq 0 ]]; then
        echo "Tags adicionadas ao grupo de log $log_group"
    else
        echo "Falha ao adicionar tags ao grupo de log $log_group: $output"
    fi
done
