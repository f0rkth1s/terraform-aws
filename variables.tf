variable "access_key" {
    description = "aws access key"
    type = string
}

variable "secret_key" {
    description = "aws secret key"
    type = string
}

variable "vpc_cidr_block" {
    description = "cidr block for the vpc"
    type = string
}

variable "subnet_prefix" {
    description = "cidr block for the subnet"
    type = string
}

variable "availability_zone_location" {
    description = "availability zone for deployment"
    type = string
}

variable "region_location" {
    description = "region zone for deployment"
    type = string
}

variable "ami_image" {
    description = "which ami to run"
    type = string
}

variable "key_pair_set" {
    description = "which keypair to use dependant on region"
    type = string
}