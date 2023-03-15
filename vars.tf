variable "region" {
  default = "us-east-1"

}

variable "zone1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0aa7d40eeae50c9a9"
  }
}

variable "instance_type" {
  default = "t2.micro"
}