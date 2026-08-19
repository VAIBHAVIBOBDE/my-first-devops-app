terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Namespace for DevOps Application Deployment
resource "kubernetes_namespace" "devops_app" {
  metadata {
    name = "my-devops-app-ns"
    labels = {
      environment = "production"
      managed-by  = "terraform"
    }
  }
}