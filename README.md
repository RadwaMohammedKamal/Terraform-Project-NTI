# Terraform-Project-NTI
<img width="1600" height="842" alt="image" src="https://github.com/user-attachments/assets/9c06be44-4d0d-4eb9-9e84-05f534f6ab4b" />

## 🚀 Project Overview

This project uses Terraform to provision AWS infrastructure and Ansible to configure an EC2 instance with Nginx.  
The infrastructure is created inside an existing VPC, where the subnet, internet gateway, route table, security group, and EC2 instance are managed.
---

## 📁 Repository Structure

```text
terraform-project-nti/
├── ansible/
│   └── playbook.yml
├── modules/
│   ├── ec2/
│   │   ├── main.tf
│   │   └── variables.tf
│   └── subnet/
│       ├── main.tf
│       └── variables.tf
├── env/
│   └── inputs.json
├── backend.tf
├── main.tf
├── provider.tf
├── security.tf
├── internet.tf
├── route-table.tf
├── route-association.tf
├── outputs.tf
├── variables.tf
└── locals.tf
---

## 🧱 Terraform Resources Created

This Terraform project creates:

- Public subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group (SSH + HTTP)
- EC2 Instance
- Ansible provisioning to install Nginx

---

## 🛠️ Ansible Playbook

The Ansible playbook installs Nginx and sets a custom index page.

---

## 📌 Output

After successful apply, Terraform outputs the public IP of the EC2 instance.

---

## 🔓 Notes

- The project uses public IP and SSH for provisioning.
- The private key is stored temporarily in `/tmp/terraform.key` during provisioning.
- Destroying removes all resources except the VPC.

---

## 🧾 Cleanup

All created resources can be destroyed without affecting the existing VPC.

---

## 📌 Add Images
![WhatsApp Image 2026-01-21 at 2 32 24 PM](https://github.com/user-attachments/assets/f1f519ae-dd6c-46d6-85a9-f661e85109a9)

<img width="1600" height="764" alt="image" src="https://github.com/user-attachments/assets/3b8a4053-8bc0-4e64-bbf9-5b3aac79888e" />


