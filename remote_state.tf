# To use S3 remote state, created in another configuration, use the terraform_remote_state data source.
data "terraform_remote_state" "julie-remote-state" {
  backend = "s3"
  config = {
    bucket = "julie-remote-state"
    key    = "aws-sandbox/dev/terraform.tfstate"
    region = "us-west-2"
  }
}
