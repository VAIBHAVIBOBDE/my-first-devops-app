# End-to-End Automated DevOps & Cloud-Native Pipeline

**Author:** Vaibhavi Bobde  
**Project:** Production-Grade CI/CD, IaC & Kubernetes Deployment

---

## Project Architecture & Workflow

This project demonstrates an automated cloud-native DevOps lifecycle, integrating continuous integration, continuous delivery, infrastructure provisioning, and container orchestration.

```text
[ Local Workstation ]
       │
       │ (git push origin main)
       ▼
[ GitHub Repository ]
       │
       │ (Triggers Pipeline)
       ▼
[ GitHub Actions CI/CD ] ──── (Multi-Stage Build) ────► [ Docker Hub Registry ]
                                                         (vaibhavibobde/my-app:latest)
                                                                      │
                                                                      │ (Pulls Image)
                                                                      ▼
                                                          [ Kubernetes Cluster ]
                                                           ├── Helm Chart Release
                                                           ├── Terraform Provisioned Resources
                                                           └── Ingress & Pod Scaling