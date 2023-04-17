variable "name" {
  description = "The app name."
  type = string
  default = "hello_world"
}

variable "region" {
  type        = string
  description = "The AWS region."
  default     = "us-west-2"
}

variable "cluster_id" {
  description = "The ECS cluster ID."
  type        = string
}

variable "app_image" {
  description = "The app image to run on ECS."
  type = string
  default = "ghcr.io/nwmahoney/hello-world-nginx:latest"
}
