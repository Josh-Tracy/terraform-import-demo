# terraform-import-demo
Repo for demonstrating the new Terraform v1.5.0 config-driven import feature

### Requirements

- Terraform v1.5.0 or higher installed
- AWS account with credentials configured for AWS provider authentication
- Existing resources in the AWS account to import

### How To

Locate existing, non-terraform managed resources in your AWS account that you would like to import and generate configurations for.

Open main.tf and create a seperate `import {}` block *FOR EVERY* resoures that you would like to import. Planable imports do not support the `count` or `for_each` parameters at this time (6/13/23). If you have 2 EC2 instances, you must create 2 unique `import` blocks.

Import blocks include `id` and `to` parameters. The `id` is the ID of the resource and the `to` is the terraform resource address to generate.

- Example of importing an EC2 Instance
```HCL
import {
  id = "i-06660efc02ae3d2a9"
 
  to = aws_instance.dev_box
}
```
- Example of importing an S3 Bucket
```HCL
import {
  id = "import-test-3523"
 
  to = aws_s3_bucket.test_bucket
}
```

- Run `terraform init`
- Run `terraform plan -generate-config-out=generated_resources.tf`. You can change the name of the .tf file to be generated if you wish
- Terraform will generate the configuration for the resources and notify you with any errors due to conflicts. The configuration is generated with all parameters available for the resoures, so you may need to edit the generated configuration to resolve errors.
- Once you are happy with the configuration run `terraform apply` to import the resources into your state file.
- Commit your new code.