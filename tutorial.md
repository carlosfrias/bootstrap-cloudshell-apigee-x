## Bootstrap Apigee X with the Apigee Terraform modules

The purpose of this tutorial is to enable you to get stated quickly bootstrap an
instance of Apigee X using the Apigee Terraform modules in a GCP project. 
The steps needed include:

1. Configure your credentials.
2. Set your project name.
3. Select the Terraform module to use
4. Update your organization policies and constraints.
5. Enable your service apis.
6. Create your service account.
7. Obtain your service account key file.
8. Update your service account permissions.
9. Invoke the build

## Configure your credentials

1. Create secure credentials folder such as suggested below. Please feel free to use your own naming convention.

    ```sh
    mkdir ~/.apigee-secure
    ```

2. Use the provided credentials template file to create your credentials file in you secure credentials folder.
  Please note that the variables defined here will be used in `resources/override.yml`

    ```sh
    cp resources/credentials.yml.template  ~/.apigee-secure/credentials.yml
    ```

4. Update your credentials file by replacing each `CHANGEME`. Assuming you followed the naming conventions in this tutorial then you can click
   <walkthrough-editor-select-regex filePath="../../.apigee-secure/credentials.yml" regex="GCLOUD_ORG_ID">credentials.yml</walkthrough-editor-select-regex> to start your updates.

    ```yaml
        ---
        GCLOUD_ORG_ID: "CHANGE_ME"
        GCLOUD_ACCOUNT_DOMAIN: "CHANGE_ME"
        BILLING_ID: "CHANGE_ME"
        GCLOUD_ACCOUNT_USER: "CHANGE_ME"
    ```

## Set your project name
1. The project name is picked up from the <walkthrough-editor-select-regex filePath="cloudshell_open/bootstrap-cloudshell-apigee-x/resources/override.yml" regex="PROJECT_ID">override.yml</walkthrough-editor-select-regex> file. (Please note that this is not the Apigee X `overrides.yml` it is named to denote that it overrides default attributes found in `default.yml`.)

## Name the Apigee X Terraform module 
1. Please indicate the name of the Apigee X Terraform module you would like to deploy in the <walkthrough-editor-select-regex filePath="cloudshell_open/bootstrap-cloudshell-apigee-x/resources/override.yml" regex="TERRAFORM_PROJECT_NAME">override.yml</walkthrough-editor-select-regex> file.
Please choose one of the following module names listed as follows:
* x-basic
* x-dns-peering
* x-iac-pipeline
* x-ilb-mtls
* x-l7xlb
* x-multi-region
* x-sb-psc
* x-shared-vpc
* x-transitive-peering

## Update organization role bindings
1. Please review default org role bindings. It is recommended that you update the default org role bindings in <walkthrough-editor-select-regex filePath="cloudshell_open/bootstrap-cloudshell-apigee-x/resources/override.yml" regex="GCLOUD_ORG_ROLE_BINDINGS">override.yml</walkthrough-editor-select-regex> file.

## Update organization disable policy constraints enforcement
1. Please review org policy constraints enforcement to be disabled. It is recommended that you update the default org role bindings in <walkthrough-editor-select-regex filePath="cloudshell_open/bootstrap-cloudshell-apigee-x/resources/override.yml" regex="GCLOUD_ORG_POLICIES_CONSTRAINTS_ENFORCEMENT_DISABLE">override.yml</walkthrough-editor-select-regex> file.

## Update org policies to allow
1. Please review org policy that should be allowed. It is recommended that you update the default org role bindings in <walkthrough-editor-select-regex filePath="cloudshell_open/bootstrap-cloudshell-apigee-x/resources/override.yml" regex="GCLOUD_ORG_POLICIES_UPDATE">override.yml</walkthrough-editor-select-regex> file.

## Service API Enablement
1. Please review the default service apis that will be enabled in your project. Please update <walkthrough-editor-select-regex filePath="cloudshell_open/bootstrap-cloudshell-apigee-x/resources/override.yml" regex="GCLOUD_PROJECT_SERVICES">override.yml</walkthrough-editor-select-regex> as needed.

## Service Account Creation
1. Please review the service account that will be created in your project. Please note that the variables here are pulled from the credentials.yml you configured in a previous step. Please update <walkthrough-editor-select-regex filePath="cloudshell_open/bootstrap-cloudshell-apigee-x/resources/override.yml" regex="SERVICE_ACCOUNT_PROTECTED_VALUES in credentials.yml">override.yml</walkthrough-editor-select-regex> as needed.

## Review work directory location
1. Please review and update the working directory location if needed <walkthrough-editor-select-regex filePath="cloudshell_open/bootstrap-cloudshell-apigee-x/resources/override.yml" regex="WORK_DIR">override.yml</walkthrough-editor-select-regex>
   Service account key files will be in this working directory.

## Update your service account permissions
1. Please review and update service account permissions if needed  <walkthrough-editor-select-regex filePath="cloudshell_open/bootstrap-cloudshell-apigee-x/resources/override.yml" regex="GCLOUD_PROJECT_SERVICE_ACCOUNT_ROLE_BINDINGS">override.yml</walkthrough-editor-select-regex>
   for the service account role bindings.

## Update your admin role permissions
1. Please review and update admin role permissions if needed  <walkthrough-editor-select-regex filePath="cloudshell_open/bootstrap-cloudshell-apigee-x/resources/override.yml" regex="GCLOUD_PROJECT_ADMIN_ROLE_BINDINGS">override.yml</walkthrough-editor-select-regex>
   for the service account role bindings.

## Activate the virtual environment and create the project
1. Login to gcloud if needed:


    ```shell
    gcloud auth login
    ```

2. Activate the python virtual environment to create the project.


    ```sh
    cd ~/bootstrap-cloudshell-apigee-x/
    gcloud auth login
    pyenv activate apigeex
    molecule converge
    ```

## Project Created
Your project should be ready in a few minutes.
<walkthrough-conclusion-trophy/>

