# local-kubernetes

Build a Local Kubernetes cluster the easiest way.

The cluster is built using [Kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/), providing 1 control-plane node and 3 worker nodes, although you can customize this setup.
## Prerequisite:
* [Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)
* [Multipass](https://multipass.run/)
* [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)

## Install

install.sh

## Reset

reset.sh

# File description

Here are key files and a brief explanation of their use:

multipass.tf: basic Terraform file to call and execute modules inside the multipass folder.

data.tf: it offers all the information to create the VMs by running the Multipass tool.

haproxy.tf: it will create the HAProxy instance and take the first control plane instance IP to generate a working HAProxy configuration file, regardless of the number of control plane nodes chosen.

haproxy_final.tf: when three control planes are created, it will create a new HAProxy configuration, including their IPs, allowing balancing the API traffic to these nodes.

    
master.tf: it will create the instance and initialize the Kubernetes control plane, allowing all other nodes to join the cluster, either as a control plane or worker node.

more_masters.tfIf the value of the variable masters is three, it will create two additional nodes. This Terraform file works with haproxy_final.tf.

template.tf: here is where the cloud-init files are created, depending on the purpose of the VM.

variables.tf: contains the value of the different variables that control the instances’ specifications, the number of desired nodes for the control plane and workers, and the Kubernetes version to be used.

workers.tf: it will create the instance/s and join it/them to the K8s cluster.

script folder: it contains configuration templates modified by the 

variable.tf file and two auxiliary scripts.

reset.sh: it allows us to delete all the resources created by Terraform.

Once we have defined whether to use the default values (two CPUs, 2GB memory, 10GB disk, one control plane, and three workers) or make some adjustments, we can execute Terraform as follows.