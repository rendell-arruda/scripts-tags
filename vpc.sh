#!/bin/bash

# Array com os IDs das VPCs que você deseja etiquetar
ids_vpcs=("vpc-024710454b05d4b21" "vpc-0e3a415dee81e29c5")

# Loop para adicionar as tags às VPCs
for id_vpc in "${ids_vpcs[@]}"; do
    output=$(aws ec2 create-tags --resources "$id_vpc" --tags Key=Produto,Value=infraestrutura Key=Subproduto,Value=infraestrutura 2>&1)

    if [[ $? -eq 0 ]]; then
        echo "Tags adicionadas à VPC $id_vpc"
    else
        echo "Falha ao adicionar tags à VPC $id_vpc: $output"
    fi
done