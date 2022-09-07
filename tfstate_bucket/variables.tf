#
#  See https://www.terraform.io/intro/getting-started/variables.html for more details.
#

#  Change these defaults to fit your needs!

variable "esxi_hostname" {
  default = "192.168.0.4"
}

variable "minio_access_key" {}

variable "minio_secret_key" {}
