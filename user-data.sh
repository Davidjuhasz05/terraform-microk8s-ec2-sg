#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

# update system
apt-get update -y
apt-get upgrade -y
apt-get install -y snapd curl apt-transport-https ca-certificates gnupg lsb-release

# install microk8s (specific stable channel)
snap install microk8s --classic --channel=1.27/stable

# wait for microk8s to be ready
microk8s status --wait-ready || true

# add ubuntu user to microk8s group
usermod -a -G microk8s ubuntu || true
mkdir -p /home/ubuntu/.kube || true
microk8s config > /home/ubuntu/.kube/config || true
chown -R ubuntu:ubuntu /home/ubuntu/.kube || true

# enable addons
microk8s enable dns || true

# prepare k8s folder where manifests will be stored
mkdir -p /home/ubuntu/k8s
chown -R ubuntu:ubuntu /home/ubuntu/k8s

# write kubernetes yaml files from terraform templates
cat > /home/ubuntu/k8s/nginx-deployment.yaml <<'EOF'
${deployment_yaml}
EOF

cat > /home/ubuntu/k8s/namespace.yaml <<'EOF'
${namespace_yaml}
EOF

# apply kubernetes manifests
microk8s kubectl apply -f /home/ubuntu/k8s/namespace.yaml
microk8s kubectl apply -f /home/ubuntu/k8s/nginx-deployment.yaml

# install nginx on host for a simple demo page
apt-get install -y nginx || true
mkdir -p /var/www/html
chown -R ubuntu:ubuntu /var/www/html

cat > /var/www/html/index.html <<'EOF'
<html>
  <head><title>Terraform + Microk8s demo</title></head>
  <body>
    <h1>Hello World!</h1>
    <p>Terraform single EC2 + Microk8s</p>
    <p>Deployed with Terraform and CI</p>
  </body>
</html>
EOF

systemctl enable --now nginx || true