# Terrafom_VPC_Structure

Here is a simple project to create a cutom VPC setup with Elastic IP, NAT Gatway, Internet Gatway and 3 private and public subnet with auto calculating its subnets. This script will run any region.

## Resources Used

- 3 Public Subnet
- 3 Private Subnet
- Internet Gateway
- NAT Gateway
- 2 Route Tables (Private and Public)
- 1 Elastic IP

## Features

- Fully Automated creation of VPC 
- It can be deployed in any region and will be fetching the available zones in that region automatically using data source AZ. 
- Public and private subnets will be deployed in each AZ in an automated way.
- Every subnet CIDR block has been calculated automatically using cidrsubnet function
- Whole project can be managed from a single file (vpc.tf) which means selecting the region, changing the whole project name, selecting VPC, and subnetting.

## Prerequisites

- Knowledge in AWS services, especially VPC, subnetting
- IAM user with necessary privileges. 

## Procedure

### Terrafom_VPC_Structure/variables.tf


At first we need to create a variable file named "variable.tf" whch includes the following
-region
-projectname
-cidr block(Here I have taken the VPC CIDR as 172.16.0.0/16 and subnetcidr as 3 for my project, for the creation of a total of 6 subnets (3 - public and 3private)

For the above-mentioned variables, values are passed into the file vpc.

### Terrafom_VPC_Structure/provider.tf

Next we need to create a provider.tf file and which includes the region,accesskey and secret key. Since I'm testing with local PC, I'm using key based aauthentication. If you are running in a instance, you can use **IAM ROLE** It is more secure and easy to impliment.

Once the provider and variables files ready, we can move to create VPC in vpc.tf

## Terrafom_VPC_Structure/main.tf

Here we are creating main part of the infra.

**1. Fetching AZ Names**

Here we grabbing AZ name to assing to subnet.

**2. VPC Creation**

Once the VPC is created, we can now proceed with the craetion of Internet Gateway(IGW)

**3. Attaching Internet GateWay**
 
In the next part, we need to subnets and here am going to create 3 public subnets and 3 private subnets

**4. Elatic Ip Allocation**

Creating elastic IP for NAT Gateway

**5. Creating Nat GateWay**

### Terrafom_VPC_Structure/subnet.tf 

**1. Creating Subnets Public1**

**2. Creating Subnets Public2**

**3. Creating Subnets Public3**

**4. Creating Subnets Private1**

**5. Creating Subnets Private2**

**6. Creating Subnets Private3**


## Terrafom_VPC_Structure/route_table.tf 

**1. RouteTable Creation public**

**2. RouteTable Creation Private**

**3. RouteTable Association Subnet Public1  rtb public**

**4. RouteTable Association Subnet Public2  rtb public**

**5. RouteTable Association Subnet Public3  rtb public**

**6. RouteTable Association Subnet Private1  rtb public**

**7. RouteTable Association Subnet private2  rtb public**

**8. RouteTable Association Subnet private3  rtb public**


Now the creation of VPC is completed.








### Terraform Installation 

- Clone the git repo and proceed with the installation of terraform if it has not been installed, otherwise ignore this step. Change the permission of the script - install.sh to executable and execute the bash script for the installation. 

- For Manual Proccedure 

- For Downloading -  [Terraform](https://www.terraform.io/downloads.html) 

- Installation Steps -  [Installation](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)


After completing these,  initialize the working directory for Terraform configuration using the below command

```sh
terraform init
```
- Validate the terraform file using the command given below.

```sh
 terraform validate
```
- After successful validation, plan the build architecture and confirm the changes

```sh
 terraform plan
```
- Apply the changes to the AWS architecture

Then need to apply the below command

```sh
 terraform apply
```









``` hcl
jisjo@jisjo~$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # aws_eip.eip will be created
  + resource "aws_eip" "eip" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = (known after apply)
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Name"    = "uno-nat-eip"
          + "project" = "uno"
        }
      + tags_all             = {
          + "Name"    = "uno-nat-eip"
          + "project" = "uno"
        }
      + vpc                  = true
    }

  # aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name"    = "uno-igw"
          + "project" = "uno"
        }
      + tags_all = {
          + "Name"    = "uno-igw"
          + "project" = "uno"
        }
      + vpc_id   = (known after apply)
    }

  # aws_nat_gateway.nat will be created
  + resource "aws_nat_gateway" "nat" {
      + allocation_id        = (known after apply)
      + connectivity_type    = "public"
      + id                   = (known after apply)
      + network_interface_id = (known after apply)
      + private_ip           = (known after apply)
      + public_ip            = (known after apply)
      + subnet_id            = (known after apply)
      + tags                 = {
          + "Name"    = "uno-nat-eip"
          + "project" = "uno"
        }
      + tags_all             = {
          + "Name"    = "uno-nat-eip"
          + "project" = "uno"
        }
    }

  # aws_route_table.private will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = ""
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = (known after apply)
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Name"    = "uno-route-private"
          + "project" = "uno"
        }
      + tags_all         = {
          + "Name"    = "uno-route-private"
          + "project" = "uno"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table.public will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Name"    = "uno-route-public"
          + "project" = "uno"
        }
      + tags_all         = {
          + "Name"    = "uno-route-public"
          + "project" = "uno"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.private1 will be created
  + resource "aws_route_table_association" "private1" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.private2 will be created
  + resource "aws_route_table_association" "private2" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.private3 will be created
  + resource "aws_route_table_association" "private3" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.public1 will be created
  + resource "aws_route_table_association" "public1" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.public2 will be created
  + resource "aws_route_table_association" "public2" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.public3 will be created
  + resource "aws_route_table_association" "public3" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_subnet.Public1 will be created
  + resource "aws_subnet" "Public1" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-south-1a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "172.16.0.0/19"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"    = "uno-public1-sg"
          + "project" = "uno"
        }
      + tags_all                        = {
          + "Name"    = "uno-public1-sg"
          + "project" = "uno"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.Public2 will be created
  + resource "aws_subnet" "Public2" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-south-1b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "172.16.32.0/19"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"    = "uno-public2-sg"
          + "project" = "uno"
        }
      + tags_all                        = {
          + "Name"    = "uno-public2-sg"
          + "project" = "uno"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.Public3 will be created
  + resource "aws_subnet" "Public3" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-south-1c"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "172.16.64.0/19"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"    = "uno-public3-sg"
          + "project" = "uno"
        }
      + tags_all                        = {
          + "Name"    = "uno-public3-sg"
          + "project" = "uno"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.private1 will be created
  + resource "aws_subnet" "private1" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-south-1a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "172.16.96.0/19"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"    = "uno-private1-sg"
          + "project" = "uno"
        }
      + tags_all                        = {
          + "Name"    = "uno-private1-sg"
          + "project" = "uno"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.private2 will be created
  + resource "aws_subnet" "private2" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-south-1b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "172.16.128.0/19"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"    = "uno-private2-sg"
          + "project" = "uno"
        }
      + tags_all                        = {
          + "Name"    = "uno-private2-sg"
          + "project" = "uno"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.private3 will be created
  + resource "aws_subnet" "private3" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-south-1c"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "172.16.160.0/19"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"    = "uno-private3-sg"
          + "project" = "uno"
        }
      + tags_all                        = {
          + "Name"    = "uno-private3-sg"
          + "project" = "uno"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.vpc will be created
  + resource "aws_vpc" "vpc" {
      + arn                            = (known after apply)
      + cidr_block                     = "172.16.0.0/16"
      + default_network_acl_id         = (known after apply)
      + default_route_table_id         = (known after apply)
      + default_security_group_id      = (known after apply)
      + dhcp_options_id                = (known after apply)
      + enable_classiclink             = (known after apply)
      + enable_classiclink_dns_support = (known after apply)
      + enable_dns_hostnames           = true
      + enable_dns_support             = true
      + id                             = (known after apply)
      + instance_tenancy               = "default"
      + ipv6_association_id            = (known after apply)
      + ipv6_cidr_block                = (known after apply)
      + main_route_table_id            = (known after apply)
      + owner_id                       = (known after apply)
      + tags                           = {
          + "Name"    = "uno-vpc"
          + "project" = "uno"
        }
      + tags_all                       = {
          + "Name"    = "uno-vpc"
          + "project" = "uno"
        }
    }

Plan: 18 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_eip.eip: Creating...
aws_vpc.vpc: Creating...
aws_eip.eip: Creation complete after 1s [id=eipalloc-01889235ea3383a24]
aws_vpc.vpc: Still creating... [10s elapsed]
aws_vpc.vpc: Creation complete after 13s [id=vpc-0da06cafca2c6324e]
aws_subnet.private3: Creating...
aws_subnet.Public1: Creating...
aws_subnet.Public3: Creating...
aws_internet_gateway.igw: Creating...
aws_subnet.private1: Creating...
aws_subnet.private2: Creating...
aws_subnet.Public2: Creating...
aws_subnet.private3: Creation complete after 1s [id=subnet-0e02cef9007eeb787]
aws_subnet.private2: Creation complete after 1s [id=subnet-0b6d0d2d1b0f5d4ce]
aws_subnet.private1: Creation complete after 1s [id=subnet-0fab3a6e6a619a281]
aws_internet_gateway.igw: Creation complete after 1s [id=igw-05ebe0e699a405db6]
aws_route_table.public: Creating...
aws_route_table.public: Creation complete after 2s [id=rtb-0cc4fa4f636f57d54]
aws_subnet.Public3: Still creating... [10s elapsed]
aws_subnet.Public1: Still creating... [10s elapsed]
aws_subnet.Public2: Still creating... [10s elapsed]
aws_subnet.Public3: Creation complete after 12s [id=subnet-0f0cab56acdf717eb]
aws_subnet.Public2: Creation complete after 12s [id=subnet-017c1b257a5787fd7]
aws_subnet.Public1: Creation complete after 12s [id=subnet-02ef2bc638307c999]
aws_route_table_association.public3: Creating...
aws_route_table_association.public2: Creating...
aws_route_table_association.public1: Creating...
aws_nat_gateway.nat: Creating...
aws_route_table_association.public2: Creation complete after 0s [id=rtbassoc-051c99d499ad26d28]
aws_route_table_association.public1: Creation complete after 1s [id=rtbassoc-0bef30d30ecd71aa5]
aws_route_table_association.public3: Creation complete after 1s [id=rtbassoc-04c98d66cdda520d4]
aws_nat_gateway.nat: Still creating... [10s elapsed]
aws_nat_gateway.nat: Still creating... [20s elapsed]
aws_nat_gateway.nat: Still creating... [30s elapsed]
aws_nat_gateway.nat: Still creating... [40s elapsed]
aws_nat_gateway.nat: Still creating... [50s elapsed]
aws_nat_gateway.nat: Still creating... [1m0s elapsed]
aws_nat_gateway.nat: Still creating... [1m10s elapsed]
aws_nat_gateway.nat: Still creating... [1m20s elapsed]
aws_nat_gateway.nat: Still creating... [1m30s elapsed]
aws_nat_gateway.nat: Still creating... [1m40s elapsed]
aws_nat_gateway.nat: Still creating... [1m50s elapsed]
aws_nat_gateway.nat: Creation complete after 1m57s [id=nat-01508cd8fd3a6e5fe]
aws_route_table.private: Creating...
aws_route_table.private: Creation complete after 2s [id=rtb-0a14adb04934fb935]
aws_route_table_association.private1: Creating...
aws_route_table_association.private2: Creating...
aws_route_table_association.private3: Creating...
aws_route_table_association.private2: Creation complete after 1s [id=rtbassoc-0acce234a73945551]
aws_route_table_association.private3: Creation complete after 1s [id=rtbassoc-0f2f2eb9076a7d5db]
aws_route_table_association.private1: Creation complete after 1s [id=rtbassoc-065282c04b7d15843]

Apply complete! Resources: 18 added, 0 changed, 0 destroyed.
```
