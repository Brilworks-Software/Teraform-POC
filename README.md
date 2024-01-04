# Terraform Script for Deploying Static Website on S3 with CloudFront

This Terraform script automates the deployment of a static website on Amazon S3 and sets up CloudFront for content delivery.

## Prerequisites

Make sure you have the following prerequisites before running the Terraform script:

- [Terraform](https://www.terraform.io/) installed on your machine.
- AWS credentials configured with the necessary permissions.

## Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/Brilworks-Software/Teraform-POC.git
    cd Teraform-POC
    ```

2. Customize the Terraform variables in `variables.tf` file according to your requirements.

3. Initialize the Terraform configuration:

    ```bash
    terraform init
    ```

4. Review the execution plan:

    ```bash
    terraform plan
    ```

5. Apply the Terraform configuration:

    ```bash
    terraform apply
    ```

6. Confirm the changes by typing `yes` when prompted.

## Terraform Variables

- `aws_region`: The AWS region where resources will be created.
- `bucket_name`: The unique name for the S3 bucket.
- `index_file_path`: The file path to the index.html file.
- `index_file_name`: The name of the index file (e.g., index.html).
- `index_document`: The custom index document for the S3 bucket.
- `error_document`: The custom error document for the S3 bucket.

## Outputs

- `cloudfront_url`: The URL of the deployed static website.

## Clean Up

To clean up and destroy the resources created by Terraform, run:

```bash
terraform destroy
