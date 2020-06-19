cd terraform
terraform apply --auto-approve
cd ..
cd ansible
ansible-playbook initial.yml 
ansible-playbook dependencies.yml 
ansible-playbook container.yml 
 