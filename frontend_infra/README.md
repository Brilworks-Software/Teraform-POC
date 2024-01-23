# Terraform Scripts for Deploying Static Website on S3 with CloudFront.

This Terraform script automates the deployment of a static website on Amazon S3 and sets up CloudFront for content delivery.

## Prerequisites

Ensure you have the following prerequisites in place before running the Terraform script:

1. **Terraform Installation:**
   - Install Terraform on your machine by following the instructions provided on the [official Terraform website](https://www.terraform.io/downloads.html).
   - Verify the installation by running `terraform --version` in your terminal.


2. **If you don't have an AWS account, create one by following these steps:**

      a. Visit the [AWS Account Signup](https://portal.aws.amazon.com/billing/signup) page.

      b. Follow the instructions to create a new AWS account.

      c. Once your account is set up, sign in to the [AWS Management Console](https://aws.amazon.com/console/).

   - Create AWS access keys for programmatic access:

      a. In the AWS Management Console, navigate to the [IAM dashboard](https://console.aws.amazon.com/iam/).

      b. In the left navigation pane, choose "Users."

      c. Select the user for which you want to create access keys.

      d. Go to the "Security credentials" tab and find the "Access keys" section.

      e. Choose "Create access key" and then download the key file. Save the file securely.

3. **AWS CLI Installation and Configuration:**
   - Install the AWS Command Line Interface (AWS CLI) on your machine. You can download and install the AWS CLI from the [official AWS CLI website](https://aws.amazon.com/cli/).
   - After installation, configure the AWS CLI by running:
     ```bash
     aws configure
     ```
     Follow the prompts to enter your AWS Access Key ID, Secret Access Key, default region, and output format.

   - Ensure that the AWS credentials provided have the necessary permissions for creating and managing resources such as RDS instances.

   **Note:** If you're using a shared or IAM role-based approach for AWS credentials, make sure the appropriate permissions are granted.

4. **Terraform Script Customization:**
   - Familiarize yourself with the variables and configuration parameters in the Terraform script (`variables.tf`).
   - Customize the variables in the `variables.tf` file to match your specific requirements.


## Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/Brilworks-Software/Teraform-POC.git
    cd Teraform-POC/frontend_infra
    ```

2. Now create a Terraform variables file, for example, `frontend.tfvars`, adhering to your specific requirements. Feel free to choose any name for the file but ensure it retains the `.tfvars` extension. Add the following variables with specific values tailored to your needs. The subsequent example showcases the creation of a s3 bucket with only single file to be server over cloudfront.
   ```
    aws_profile     = "default"
    bucket_name     = "tf-s3-test-lavesh"
    index_file_path = "index.html"
    index_file_name = "index.html"
    index_document  = "index.html"
    error_document  = "error.html"
   ```


3. Initialize the Terraform configuration:

    ```bash
    terraform init
    ```

4. Review the execution plan:

    ```bash
    terraform plan -var-file frontend.tfvars
    ```

5. Apply the Terraform configuration:

    ```bash
    terraform apply -var-file frontend.tfvars
    ```

6. Confirm the changes by typing `yes` when prompted.


## Terraform Variables

### S3 & Cloudfront Variables
- `aws_region`: The AWS region where resources will be created.
- `aws_profile`: The AWS account profile which you have setup during `aws configure` command
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
terraform destroy  -var-file frontend.tfvars
