# Small utility docker image for gcloud sdk

![Docker Build Status](https://img.shields.io/docker/build/getuniverse/gcloud-sdk.svg)

Meant to be used in CI environments, allowing minimal gcloud configuration in the CI. 
The image uses always the latest version of the [google/cloud-sdk:slim](https://hub.docker.com/r/google/cloud-sdk/).

Docker Hub: https://hub.docker.com/r/getuniverse/gcloud-sdk/

## Utilities

### setup-gcloud

    gcloud CLI setup sript

    Provide the variables as parameters or have environment
    variables GCLOUD_PROJECT and GCLOUD_API_KEYFILE available.
    See gcloud documentation: https://cloud.google.com/sdk/gcloud/reference/auth/activate-service-account.

    Usage: setup-gcloud [options]

    Options:
      --project=<GCLOUD_PROJECT>        Give the project name.
      --key=<GCLOUD_API_KEYFILE>    Give the service account as base64 encoded string.
      --password=<FILE_PASSWORD>        Base64 encoded password (only for .p12 files)
      --help                            Show this message

## Bitbucket Pipelines Example

Requires that `SERVICE_ACCOUNT` is defined as environment variable in Bitbucket Environment
variables. The value needs to be Base64 Encoded contents of the serviceaccoun key file (json).

    image: getuniverse/gcloud-sdk
    pipelines:
      default:
        - step:
            script:
              - setup-gcloud --project=my_project_name --key=$SERVICE_ACCOUNT
