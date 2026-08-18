# 1. Terraform Provider Configuration
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25.0"
    }
  }
}

# 2. Kubernetes Provider Configuration (Minikube / Local K8s Context)
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# 3. Create a Kubernetes Namespace using Terraform
resource "kubernetes_namespace" "terraform_env" {
  metadata {
    name = "terraform-dev"
  }
}

# 4. Create a Deployment inside that Namespace
resource "kubernetes_deployment" "nginx_app" {
  metadata {
    name      = "tf-nginx-app"
    namespace = kubernetes_namespace.terraform_env.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "tf-nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "tf-nginx"
        }
      }

      spec {
        container {
          image = "nginx:alpine"
          name  = "nginx"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}