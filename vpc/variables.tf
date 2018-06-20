variable "region" {
    default = "us-east-1"
}
variable "cidr_block" {
    description  = "The CIDR range for the VPC. This should be a valid private (RFC 1918) CIDR range."
}
variable "vpc_name" {
    description  = "VPC Name"
  
}

variable "tenancy" {
    description = "Tenancy details"
  
}

variable "subnet-count" {
    default = "3"
}
variable "subnet_cidr" {
    type = "list"
    default = [
        "10.0.1.0/24",
         "10.0.2.0/24",
          "10.0.3.0/24"]
    description = "list subnets"
  
}

variable "subnet_name" {
    type = "list"
    description = "List of Names"
  
}

variable "availability_zone" {
    default = {
        "us-east-1" = "us-east-1c, us-east-1b, us-east-1d"
    }
    description = "List of AZ"
  
}


variable "igw_name" {
  
}





