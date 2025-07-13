variable "region" {
 default = "ap-south-1" 
 }
variable "cidr_block"{
 default = "10.0.0.0/16" 
 }
variable "public_subnet_cidr_blocks" {
 default = ["10.0.1.0/24", "10.0.2.0/24"] 
 }
variable "availability_zones" {
 default = ["ap-south-1a", "ap-south-1b"] 
 }
variable "ecr_repository_name"{
 default = "medusa-backend" 
 }
variable "allowed_cidr" {
  default = "0.0.0.0/0"
}
