# Terraform Scripts for Setting up beanstalk environment for a specified platform.

This Terraform script automates the process of configuring an Elastic Beanstalk application alongside Route 53 setup for the specified domain. Additionally, it generates an ACM certificate to enable the application to run on `https`.

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
    cd Teraform-POC/ebs_infra
    ```

2. Now create a Terraform variables file, for example, `ebs.tfvars`, adhering to your specific requirements. Feel free to choose any name for the file but ensure it retains the `.tfvars` extension. Add the following variables with specific values tailored to your needs. The subsequent example showcases the creation of an EBS environment for a Java application running on Corretto 17.
   ```
    aws_profile                 = "default"
    aws_region                  = "us-east-1"
    environment_name            = "tf-test-env"
    application_name            = "tf-test-app"
    solution_stack_name         = "64bit Amazon Linux 2023 v4.1.2 running Corretto 17"
    root_volume_size            = 20
    instance_type               = "t2.micro"
    max_batch_size              = 2
    min_instance_in_service     = 1
    min_auto_scaling_group_size = 1
    max_auto_scaling_group_size = 2
    root_domain_name            = "example.com"

   ```

3. Initialize the Terraform configuration:

    ```bash
    terraform init
    ```

4. Review the execution plan:

    ```bash
    terraform plan -var-file ebs.tfvars
    ```

5. Apply the Terraform configuration:

    ```bash
    terraform apply -var-file ebs.tfvars
    ```

6. Confirm the changes by typing `yes` when prompted.

7. After the apply completes, reveal the generated password using the following command:

    ```bash
    terraform output -raw rds_password
    ```

## Terraform Variables

### Elastic Beanstalk Variables

- `aws_region`: The AWS region where resources will be created.
- `aws_profile`: The AWS account profile which you have setup during `aws configure` command
- `environment_name`: A unique name for your Elastic Beanstalk environment.
- `application_name`: The name of your Elastic Beanstalk application.
- `solution_stack_name`: The solution stack to use for your Elastic Beanstalk environment (e.g., '64bit Amazon Linux 2023 v4.1.2 running Corretto 17').
- `root_volume_size`: The size of the root volume for instances in the Elastic Beanstalk environment.
- `max_batch_size`: The maximum batch size for updates to instances in the Elastic Beanstalk environment.
- `instance_type`: The EC2 instance type for instances in the Elastic Beanstalk environment.
- `min_instance_in_service`: The minimum number of instances allowed in the Elastic Beanstalk environment.
- `min_auto_scaling_group_size`: The minimum size of the Auto Scaling group for the Elastic Beanstalk environment.
- `max_auto_scaling_group_size`: The maximum size of the Auto Scaling group for the Elastic Beanstalk environment.
- `root_domain_name`: The root domain name for the Elastic Beanstalk environment.


## Clean Up

To clean up and destroy the resources created by Terraform, run:

```bash
terraform destroy -var-file ebs.tfvars
