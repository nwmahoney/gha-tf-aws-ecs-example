# GitHub Actions Terraform AWS ECS Example
This example was created by following [Hashicorp's *Automate Terraform with GitHub Actions* tutorial](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions).

## Setup
1. Set up [the necessary prerequisites](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions#prerequisites).
    - GitHub account
    - Terraform Cloud account
    - AWS account
2. [Set up Terraform Cloud](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions#set-up-terraform-cloud).
    1. Create a new workspace.
        - Select **API-driven workflow**.
        - Give it the same name as your GitHub repository.
    2. Add the following Environment Variables to your new workspace and mark them as sensitive. **TODO:** Provide steps to create a Terraform IAM user in AWS and generate an Access Key.
        - `AWS_ACCESS_KEY_ID`
        - `AWS_SECRET_ACCESS_KEY`
    3. Generate an [API Token](https://app.terraform.io/app/settings/tokens) and name it `GitHub Actions`. Save this token in a safe place. You will add it to GitHub later as a secret, so the Actions workflow can authenticate to Terraform Cloud.
3. [Set up your GitHub repository](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions#set-up-a-github-repository).
    1. Navigate to the Settings page. Open the Secrets and variables menu, then select Actions.
    2. Select **New repository secret** and create a secret named `TF_API_TOKEN`. Set the value to your new Terraform Cloud API Token (see previous steps).
    3. (Optional) Add **Require status checks to pass before merging** as a [Branch Protection rule](https://docs.github.com/en/enterprise/2.16/admin/developer-workflow/configuring-protected-branches-and-required-status-checks). **TODO:** Does this require the `Terraform` workflow to be pushed to the repo? If so, should this step be later in the README?
4. Edit `main.tf` to use your Terraform Cloud organization and workspace names. This is necessary because the `terraform` block can't use variables.
        ```terraform
        terraform {
          ...
          cloud {
            organization = "nwmahoney"

            workspaces {
              name = "gha-tf-aws-ecs-example"
            }
          }
        }
        ```
