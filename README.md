# 4640-w9-lab-start-w25
### By Brock Yuan

##### Generating and Importing Key

```
ssh-keygen -t ed25519 -f ~/.ssh/aws-4640 -C "Lab 9 key" 

./import_lab_key ~/.ssh/aws-4640.pub

```

##### Packer commands

```
packer init packer
packer validate packer
packer build packer


```

##### Terraform commands

```
terraform init
terraform validate 
terraform plan
terraform apply 
terraform destroy
```
##### Screenshots
![](images/lab9-1.png)
![](images/lab9-2.png)