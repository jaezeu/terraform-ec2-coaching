terraform {
  backend "s3" {
    bucket = "sctp-ce4-tfstate-bucket"
    key    = "jaz-prd-ec2.tfstate" #Remember to change this
    region = "ap-southeast-1"      #The region of your backend bucket
  }
}