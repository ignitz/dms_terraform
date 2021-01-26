# DMS task Postgres to S3

> Yuri Niitsuma <ignitzhjfk@gmail.com>

Simple DMS task Postgres to S3 building with `terraform` to migrate from the database to S3. Need to enable CDC in the postgres database.

## Usage

Fill variables in `terraform.tfvars` and then execute `terraform apply`.

## Issues

By limitation from the aws's api, the terraform cannot automatic run the task after cretead like in web console. Read more on the github issue discusiion [Link](https://github.com/hashicorp/terraform-provider-aws/issues/2083).