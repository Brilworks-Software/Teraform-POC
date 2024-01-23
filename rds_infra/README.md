# Terraform Script for creating RDS and generate credentials.

This Terraform script creates RDS and generates credentials.

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
    cd Teraform-POC/rds_infra
    ```

2. Now create a Terraform variables file, for example, `mysql.tfvars`, adhering to your specific requirements. Feel free to choose any name for the file but ensure it retains the `.tfvars` extension. Add the following variables with specific values tailored to your needs. The subsequent example showcases the creation of an RDS for MySQL 5.7; however, feel free to modify these values according to your requirements.
   ```
    aws_profile                = "default"
    rds_username               = "admin"
    rds_db_name                = "mydb"
    rds_db_port                = 3306
    rds_db_engine              = "mysql"
    rds_db_engine_version      = "5.7"
    rds_db_instance_type       = "db.t2.micro"
    rds_db_storage_size        = 20
    rds_db_tag                 = "mydb"
    rds_db_skip_final_snapshot = true
    rds_db_publicly_accessible = true

   ```

3. Initialize the Terraform configuration:

    ```bash
    terraform init
    ```

4. Review the execution plan:

    ```bash
    terraform plan -var-file mysql.tfvars
    ```

5. Apply the Terraform configuration:

    ```bash
    terraform apply -var-file mysql.tfvars
    ```

6. Confirm the changes by typing `yes` when prompted.

7. After the apply completes, reveal the generated password using the following command:

    ```bash
    terraform output -raw rds_password
    ```

## Terraform Variables

### Common Variables

### RDS Variables

- `aws_region`: The AWS region where resources will be created.
- `aws_profile`: The AWS account profile which you have setup during `aws configure` command
- `rds_username`: The username for the RDS instance.
- `rds_db_name`: The name of the default database on the RDS instance.
- `rds_db_port`: The port on which the RDS instance accepts connections.
- `rds_db_engine`: The name of the database engine to be used for the RDS instance.
- `rds_db_engine_version`: The version number of the database engine to be used for the RDS instance.
- `rds_db_instance_class`: The compute and memory capacity of the RDS instance.
- `rds_db_storage_size`: The amount of storage (in GB) to allocate to the RDS instance.
- `rds_db_tag`: Additional tags to apply to the RDS instance.
- `rds_db_skip_final_snapshot`: Determines whether a final DB snapshot is created before deleting the RDS instance.
- `rds_db_publicly_accessible`: Specifies whether the RDS instance can be publicly accessed.


## Outputs

- `rds_endpoint`: The endpoint of the created RDS instance.
- `rds_username`: The username for accessing the RDS instance.
- `rds_password`: The generated password for accessing the RDS instance.

## Clean Up

To clean up and destroy the resources created by Terraform, run:

```bash
terraform destroy -var-file mysql.tfvars
```
