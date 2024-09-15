#!/bin/bash

echo "Install Test Cluster..."

echo "Install helm,multipass,terraform,kubectl,mkcert with homebrow..."
# brew install helm
# brew install kubectl
# brew tap hashicorp/tap
# brew install hashicorp/tap/terraform
# brew install multipas
# brew install mkcert

echo "Terraform init..."
terraform init

echo "Terraform apply..."
terraform apply -auto-approve

echo "List multipass VMs"
multipass list

GET kubeconfig
cp /Users/$USER/.kube/config-multipass kube-config
KUBECONFIG=/Users/pokolpeter/Projects/terraform-kubernetes-multipass/kube-config

echo "Kubernetes cluster install Done"
kubectl cluster-info
kubectl get nodes




