multipass delete --all
multipass purge
rm multipass/cloud-init-*.yaml
rm multipass/haproxy_*.cfg
rm terraform.tfstate
rm /tmp/hosts_ip.txt
rm ~/.kube/config-multipass
