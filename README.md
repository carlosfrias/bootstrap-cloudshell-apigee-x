# Bootstrap Apigee X with Apigee Terraform modules  

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/carlosfrias/bootstrap-cloudshell-apigee-x.git&cloudshell_tutorial=tutorial.md&cloud_workspace=/)
This Cloud Shell instance will allow you to provision and de-provision an Apigee X instance
using [Apigee X Terraform modules](https://github.com/apigee/terraform-modules.git). It is 
required that you provide the project name, credentials, terraform project module name and execute the build. 
The steps provided below would allow you to capture the downloaded service account credential 
files and any org policies that have been applied. This project manager uses 
the `gcloud` cli. This has been implemented with Ansible and wrapped with the molecule framework. 

# Table of Contents
1. [Bootstrap Project Manager Features](#bootstrap-project-manager-features)
2. [Bootstrap Project Manager Overview](#bootstrap-project-manager-overview)
3. [Build Scenarios Description](#build-scenarios-descriptions)

# Project Features
The features of this project will allow you to add or remove the following: 
1. Create or destroy a project with the name provided, if it is available for your use.
2. Apply organization policies or disable organization constraints. 
3. Enable Service APIs.
4. Create service account 
5. Download service account keys
6. Set service account permissions
7. Create or remove an Apigee X instance 

The framework used allows you to gain the ability to selectively invoke individual steps or 
fully deploy an instance in one invocation. The framework enables you to discreetly 
add, create and configure each step independently of the others and thus enable 
you to manage the different steps of deploying an Apigee X instance.  

# Bootstrap Apigee X with Apigee Terraform modules Overview
The creation of a GCP project has been broken down into 6 steps. The use of terraform adds an additional 
2 steps. These steps have been defined using molecule scenarios. The default molecule scenario executes 
each step in sequence and accomplishes an Apigee X deployment with Terraform in a single invocation. 
Each scenario is invoked individually. This means that whether you invoke the default scenario or 
invoke each scenario individually you will always be executing the same scripts for the corresponding step. 
You obtain freedom to explore different areas of the Apigee X knowing that you can always reset to a known state.

## Build Scenarios Descriptions
A default scenario has been defined as a master scenario that invokes each of the scenario steps until a GCP project is built. 
The default scenario is invoked as follows: 

       molecule converge

The 6 scenario have been defined as:

| Invocation Sequence | Scenario name                | Scenario Invocation                                | Scenario Description                                                                   |
|---------------------|------------------------------|----------------------------------------------------|----------------------------------------------------------------------------------------|
| 1.                  | provision-project            | `molecule converge -s provision-project`           | Create or destroy a project with the name provided, if it is available for your use.   |
| 2.                  | config-org-policies          | `molecule converge -s config-org-policies`         | Apply organization policies or disable organization constraints  |                         
| 3.                  | config-services              | `molecule converge -s config-services`             | Enable Service APIs.
| 4.                  | config-svc-accts-create      | `molecule converge -s config-svc-accts-create`     | Create service account                                                   |
| 5.                  | config-svc-accts-keys        | `molecule converge -s config-svc-accts-keys`       | Download service account keys                                        |
| 6.                  | config-svc-accts-permissions | `molecule converge -s config-svc-accts-permissions` | Set service account permissions                                   |
| 7. | terraform-vars | `molecule converge -s terraform-vars` | Update terraform variables from those set in override.yml |
| 8. | terraform | `molecule converge -s terraform` | Execute `terraform init`, `terraform fmt`, `terraform plan` and `terraform apply -auto-approve` |

### Invocations using Debug Mode
All molecule scenarios can be invoked in debug mode with increased log verbosity. 
Each molecule scenarios can be invoked in debug mode at the command line by adding the 
flags `--debug -vvv` to the molecule command in the following way: 

       molecule --debug -vvv converge

This can be applied to scenario invocations in the following way: 

       molecule --debug -vvv converge -s provision-project

### Administrative Bits
* A new copy of the project will be installed in the folder `~/cloudshell_open/bootstrap-cloudshell-apigee-x`. 
  Please navigate to this folder to work on your project.  
* A new copy of the project will be installed each time the link above invoked. 
