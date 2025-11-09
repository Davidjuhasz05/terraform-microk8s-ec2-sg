<a id="readme-top"></a>


<!-- PROJECT LOGO -->
<br />
<div align="center">
<h3 align="center">Terraform: EC2 + Security Group + Microk8s</h3>

  <p align="center">
    A simple EC2 instance with Microk8s + a Security Group that allows SSH from a specified IP address and HTTP.
    <br />
    <a href="https://github.com/Davidjuhasz05/terraform-microk8s-ec2-sg"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Davidjuhasz05/terraform-microk8s-ec2-sg/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/Davidjuhasz05/terraform-microk8s-ec2-sg/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#how-to-apply-locally">How to Apply Locally</a></li>
      </ul>
    </li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project

### Built With

[![Terraform]][Terraform-url]
[![Kubernetes]][Kubernetes-url]


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

Make sure these are installed and configured on your system:

  * Configured AWS account with IAM credentials and permissions
  * SSH keypair (public key can be local or on AWS)
  * [Terraform][Terraform-download-url] installed

### How to Apply Locally

#### Step 1: Clone the repository
```bash
git clone https://github.com/Davidjuhasz05/terraform-microk8s-ec2-sg.git
cd terraform-microk8s-ec2-sg
```

#### Step 2: Configure Terraform
- Create an S3 bucket for the state file with the name `tf-mk8s-vm-state-bucket`

- Remove the `.example` extension from `terraform.tfvars.example`, then fill in the required information

#### Step 3: Apply the infrastructure
```bash
terraform apply -auto-approve
```
Wait for the creation, and you should be able to SSH into the instance using your private key

#### Step 4: Destroy the infra after finishing
```bash
terraform destroy -auto-approve
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Davidjuhasz05/terraform-microk8s-ec2-sg.svg?style=for-the-badge
[contributors-url]: https://github.com/Davidjuhasz05/terraform-microk8s-ec2-sg/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Davidjuhasz05/terraform-microk8s-ec2-sg.svg?style=for-the-badge
[forks-url]: https://github.com/Davidjuhasz05/terraform-microk8s-ec2-sg/network/members
[stars-shield]: https://img.shields.io/github/stars/Davidjuhasz05/terraform-microk8s-ec2-sg.svg?style=for-the-badge
[stars-url]: https://github.com/Davidjuhasz05/terraform-microk8s-ec2-sg/stargazers
[issues-shield]: https://img.shields.io/github/issues/Davidjuhasz05/terraform-microk8s-ec2-sg.svg?style=for-the-badge
[issues-url]: https://github.com/Davidjuhasz05/terraform-microk8s-ec2-sg/issues
[license-shield]: https://img.shields.io/github/license/Davidjuhasz05/terraform-microk8s-ec2-sg.svg?style=for-the-badge
[license-url]: https://github.com/Davidjuhasz05/terraform-microk8s-ec2-sg/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/david-juhasz-dave
[website-screenshot]: website_screenshot.png

[JavaScript]: https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=000
[JavaScript-url]: https://developer.mozilla.org/en-US/docs/Web/JavaScript
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://react.dev
[Vite.js]: https://img.shields.io/badge/Vite-646CFF?style=for-the-badge&logo=vite&logoColor=white
[Vite-url]: https://vite.dev
[React-Router.js]: https://img.shields.io/badge/React_Router-CA4245?style=for-the-badge&logo=react-router&logoColor=white
[React-Router-url]: https://reactrouter.com
[Spring-Boot]: https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=spring&logoColor=white
[Spring-Boot-url]: https://spring.io/projects/spring-boot
[Java]: https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white
[Java-url]: https://www.oracle.com/java
[Maven]: https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white
[Maven-url]: https://maven.apache.org
[PostgreSQL]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[PostgreSQL-url]: https://www.postgresql.org
[Docker]: https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white
[Docker-url]: https://www.docker.com
[Kubernetes]: https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white
[Kubernetes-url]: https://kubernetes.io
[kubectl-url]: https://kubernetes.io/docs/tasks/tools
[Terraform]: https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white
[Terraform-url]: https://developer.hashicorp.com/terraform
[Terraform-download-url]: https://developer.hashicorp.com/terraform/downloads
[Helm]: https://img.shields.io/badge/Helm-0F1326?style=for-the-badge&logo=helm&logoColor=white
[Helm-url]: https://helm.sh
[Helm-install-url]: https://helm.sh/docs/intro/install
[AWS-CLI-url]: https://aws.amazon.com/cli