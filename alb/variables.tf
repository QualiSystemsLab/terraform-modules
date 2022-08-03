variable "sandbox_id" {
  
}

variable "region" {

}

variable "vpc" {
    description = "VPC ID"
}

variable "allowed_cidr" {
    description = "CIDR Block for allowed trafic"
    default = "0.0.0.0/0"
}

variable "application_port" {
    //default = 80
}

variable "listener_port" {
  
}

variable "subnets" {
    description = "list of subnet ids"
}

variable "instance_id" {
    description = "ID of the EC2 instance to recieve trafic"  
}