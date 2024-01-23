# Prerequisites for setting up local machine for terraform and AWS.

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