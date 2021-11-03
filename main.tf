# DATA SOURCES
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name" #case sensitive, filter options listed here: https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-images.html
    values = ["amzn2-ami-hvm-2.0.20211005.0-x86_64-gp2"]
  }
}

data "aws_vpc" "example-vpc" {
  id = var.vpc_id
}

data "aws_subnet" "example-vpc-public-us-west-2b" {
  id = var.subnet_id
}

# RESOURCES
resource "aws_instance" "julie-test" {
  count = var.is_test == true ? 1 : 0

  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type[1]

  root_block_device {
    encrypted             = true
    delete_on_termination = true
  }

  subnet_id = data.aws_subnet.example-vpc-public-us-west-2b.id

  tags = merge(local.common_tags,
    {
      Name = "julie-test"
  })

  volume_tags = local.common_tags
}

resource "aws_instance" "julie-prod" {
  count = var.is_test == false ? 1 : 0

  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type[1]

  root_block_device {
    encrypted             = true
    delete_on_termination = true
  }

  subnet_id = data.aws_subnet.example-vpc-public-us-west-2b.id

  tags = merge(local.common_tags,
    {
      Name = "julie-prod"
  })

  volume_tags = local.common_tags
}

