```md
# Terraform With AWS 🚀

This project provisions a **secure AWS infrastructure using Terraform**, following AWS networking best practices.

The architecture is designed so that **EC2 instances are isolated from direct internet access**, while still being able to **reach the internet outbound through a NAT Gateway**.

---

## 🏗 Architecture Overview

The infrastructure uses the official **terraform-aws-modules/vpc/aws** module and consists of:

- Custom VPC
- Public subnets (for NAT Gateway and optional Load Balancer)
- Private subnets (for EC2 instances)
- Internet Gateway (created automatically by the VPC module)
- NAT Gateway for outbound internet access
- EC2 instances without public IPs
- Security Groups with controlled access

### Traffic Flow

```

EC2 (Private Subnet)
|
| 0.0.0.0/0
v
NAT Gateway (Public Subnet)
|
v
Internet Gateway
|
Internet

```

✔ No public IPs on EC2  
✔ No inbound internet access  
✔ Outbound internet access via NAT  

---

## 🔐 Security Design

- EC2 instances run in **private subnets**
- No public IPs are assigned
- Inbound traffic is restricted to internal sources (e.g. Load Balancer)
- All outbound traffic is routed through a NAT Gateway

This ensures the instances are **not reachable from the internet** while still being able to install updates or call external APIs.

---

## 📁 Project Structure

```

.
├── backend.tf        # Terraform backend configuration
├── main.tf           # Provider configuration
├── vpc.tf            # VPC, subnets, NAT configuration
├── instence.tf       # EC2 instance resources
├── loadbalancer.tf   # Load balancer resources (optional)
├── vars.tf           # Variables
├── out.tf            # Outputs
└── README.md         # Documentation

````

---

## ⚙️ Prerequisites

- Terraform >= 1.3
- AWS CLI configured
- AWS account with permissions for VPC, EC2, and networking resources

---

## 🚀 Deployment Steps

1. Clone the repository:
```bash
git clone https://github.com/AmaarElgerzawy/Terraform-With-AWS.git
cd Terraform-With-AWS
````

2. Initialize Terraform:

```bash
terraform init
```

3. Review the plan:

```bash
terraform plan
```

4. Apply the infrastructure:

```bash
terraform apply
```

---

## 🔍 Verification Checklist

After deployment:

* EC2 instance:

  * ❌ No public IPv4 address
  * ✅ Can access the internet outbound
* NAT Gateway:

  * Deployed in a public subnet
  * Has an Elastic IP
* Route tables:

  * Public subnet → `0.0.0.0/0` → Internet Gateway
  * Private subnet → `0.0.0.0/0` → NAT Gateway

---

## ✅ Best Practices Demonstrated

* Private EC2 instances without public IPs
* Separation of public and private subnets
* NAT Gateway for outbound-only internet access
* Infrastructure as Code with Terraform modules
* Secure and scalable AWS network design

## 🧠 Key Takeaway

> **An Internet Gateway alone does not expose EC2 instances.
> Public IPs and routing do.**

This project demonstrates a **production-style AWS architecture** that balances security and functionality.

```

