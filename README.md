[![Terraform](https://github.com/kcemenike/terraform/actions/workflows/terraform.yml/badge.svg)](https://github.com/kcemenike/terraform/actions/workflows/terraform.yml)

# Beginner and Advanced Terraform deployment

This repos shows you how to execute a deployment using terraform

## Beginner ([main.tf](./beginner/main.tf))
A simple nginx deployment on Docker.  
It saves the state in terraform.tfstate  
To deploy, run
```
terraform init
terraform plan
terraform apply
```

The server should be available on port 8000  
To destroy, run `terraform destroy`

## Advanced ([main.tf](./aws/main.tf))
This deployment creates an AWS instance.  
It saves the plan and state in your terraform cloud account.  
To deploy:
- change the `organization` and `workspaces` values to the ones corresponding to your organisation and workspace.
- Run `terraform login` to authenticate your session to Terraform cloud.
- Add AWS credentials to your session:  
  ```
  export AWS_ACCESS_KEY_ID=<<your access key>>   
  export AWS_SECRET_ACCESS_KEY=<<your secret key>>
  export AWS_DEFAULT_REGION=<<your default region>>
  ```
- Run 
  ```
  terraform init
  terraform plan
  terraform apply
  ```
A EC2 instance should be created in your AWS account.  
To destroy, run `terraform destroy`