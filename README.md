# Terraform Scripts for Deploying Static Website on S3 with CloudFront, create RDS and generate credentials.

This Terraform script automates the deployment of a static website on Amazon S3 and sets up CloudFront for content delivery, creates RDS and generates credentials.

## Prerequisites

Ensure you have the following prerequisites in place before running the Terraform script:

1. **Terraform Installation:**
   - Install Terraform on your machine by following the instructions provided on the [official Terraform website](https://www.terraform.io/downloads.html).
   - Verify the installation by running `terraform --version` in your terminal.

2. **AWS CLI Installation and Configuration:**
   - Install the AWS Command Line Interface (AWS CLI) on your machine. You can download and install the AWS CLI from the [official AWS CLI website](https://aws.amazon.com/cli/).
   - After installation, configure the AWS CLI by running:
     ```bash
     aws configure
     ```
     Follow the prompts to enter your AWS Access Key ID, Secret Access Key, default region, and output format.

   - Ensure that the AWS credentials provided have the necessary permissions for creating and managing resources such as RDS instances.

   **Note:** If you're using a shared or IAM role-based approach for AWS credentials, make sure the appropriate permissions are granted.

3. **Terraform Script Customization:**
   - Familiarize yourself with the variables and configuration parameters in the Terraform script (`variables.tf`).
   - Customize the variables in the `variables.tf` file to match your specific requirements.


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

7. After the apply completes, reveal the generated password using the following command:

    ```bash
    terraform output -raw rds_password
    ```

## Terraform Variables

- `aws_region`: The AWS region where resources will be created.
- `bucket_name`: The unique name for the S3 bucket.
- `index_file_path`: The file path to the index.html file.
- `index_file_name`: The name of the index file (e.g., index.html).
- `index_document`: The custom index document for the S3 bucket.
- `error_document`: The custom error document for the S3 bucket.
- `rds_username`: The username for the RDS instance.
- `rds_db_name`: The name of the default database on the RDS instance.
- `rds_db_port`: The port on which the RDS instance accepts connections.
- `rds_db_engine`: The name of the database engine to be used for the RDS instance.
- `rds_db_engine_version`: The version number of the database engine to be used for the RDS instance.
- `rds_db_instance_class`: The compute and memory capacity of the RDS instance.
- `rds_db_storage_size`: The amount of storage (in GB) to allocate to the RDS instance.
- `rds_db_tag`: Additional tags to apply to the RDS instance.
- `rds_db_parameter_group_family`: The family of the DB parameter group for the RDS instance.
- `rds_db_skip_final_snapshot`: Determines whether a final DB snapshot is created before deleting the RDS instance.
- `rds_db_publicly_accessible`: Specifies whether the RDS instance can be publicly accessed.

## Outputs

- `cloudfront_url`: The URL of the deployed static website.
- `rds_endpoint`: The endpoint of the created RDS instance.
- `rds_username`: The username for accessing the RDS instance.
- `rds_password`: The generated password for accessing the RDS instance.

## Clean Up

To clean up and destroy the resources created by Terraform, run:

```bash
terraform destroy
