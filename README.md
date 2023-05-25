# Kubernetes Helm Chart For WordPress

A Helm Chart for WordPress with MySQL Database that can be deployed on Kubernetes/OKD.
Image is being pulled from Bitnami Repository.

How to RUN the project:
1. Install and setup Minikube (for local deployment) or install OpenShift CLI and login to the cluster.
2. Run ```helm dependancy update wd-helm```
3. Run ```helm install wordpress ./wd-helm```
