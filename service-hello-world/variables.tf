variable "cluster_id" {
  description = "The ECS cluster ID"
  type        = string
}

variable "region" {
  type        = string
  description = "The AWS region in which resources are to be deployed."
  default     = "us-west-2"
}
