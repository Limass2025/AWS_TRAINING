The following is a project guide to submit your work, which is structured in a format suitable for a platform like a VS Code Markdown file. This guide provides a clear, step-by-step process for documenting and submitting your AWS security project, including where to place your screenshots.


# AWS Security Project: Security Groups and NACLs

## Project Overview

This project demonstrates the fundamental concepts of AWS security by exploring the behavior of Security Groups (SGs) and Network Access Control Lists (NACLs). We will document the process of configuring these security features and analyzing how they control inbound and outbound traffic to an EC2 instance.

### Key Concepts

* **Security Group (SG):** Acts as a virtual firewall for a single instance. SGs are **stateful**, meaning that if you allow inbound traffic, the return outbound traffic is automatically permitted, and vice versa.
* **Network ACL (NACL):** An optional layer of security for a subnet. NACLs are **stateless**, which means you must explicitly allow both inbound and outbound traffic.

## Part 1: Exploring Security Groups

In this section, we will use a running EC2 instance hosting a website to test and verify the effects of different Security Group rules.


### Scenario 1: Initial State - Website Not Accessible

**Description:** The EC2 instance is running, but the website is not accessible via its public IP address. This is because the attached security group does not have a rule to allow HTTP traffic.
![alt text](<Screenshot 2025-08-05 142912.png>)
![alt text](<Screenshot 2025-08-05 144400.png>)
![alt text](<Screenshot 2025-08-05 144415.png>)
![alt text](<Screenshot 2025-08-05 144600.png>)

![alt text](<Screenshot 2025-08-05 151026.png>)


### Scenario 2: Creating a New Security Group

**Description:** To make the website accessible, we need to create a new security group that allows incoming HTTP traffic on port 80.

* **Step 1: Create a Security Group**
    * In the AWS console, navigate to **EC2 > Security Groups**.
    * Click **Create security group**.
    * Give it a name and a description, and select the correct VPC.

* **Step 2: Add Inbound Rules**
    * In the **Inbound rules** section, click **Add rule**.
    * Select **HTTP** for the type, and set the source to `0.0.0.0/0` (or `Anywhere-IPv4`) to allow all traffic.
![alt text](<Screenshot 2025-08-05 145142.png>)
![alt text](<Screenshot 2025-08-05 145205.png>)
![alt text](<Screenshot 2025-08-05 145232.png>)

### Scenario 3: Attaching the Security Group to the Instance

**Description:** The new security group needs to be attached to the EC2 instance to take effect.

* **Step 1: Navigate to the Instance**
    * Go to **EC2 > Instances** and select your running instance.
    * Click on **Actions > Security > Change security groups**.

* **Step 2: Attach the New SG**
    * In the **Change security groups** window, select the new security group you just created.
    * Click **Add security group** and then **Save**.

![alt text](<Screenshot 2025-08-05 145336.png>)

### Scenario 4: Verifying Website Accessibility

**Description:** After attaching the new security group, the website should now be accessible. The inbound rule allows HTTP traffic to reach the instance.

* **Screenshot Placement:** Place a screenshot here showing the browser successfully loading the website content, confirming that the security group is working as expected.
![alt text](<Screenshot 2025-08-05 145422.png>)

### Scenario 5: The Stateful Nature of Security Groups

**Description:** To demonstrate the stateful nature of security groups, we will remove the outbound rule that allows all traffic.

* **Step 1: Remove the Outbound Rule**
    * Go to the details of your new security group.
    * Click on the **Outbound rules** tab, then **Edit outbound rules**.
    * Delete the rule that allows "All traffic" to `0.0.0.0/0`.
    * Click **Save rules**.

* **Step 2: Test Connectivity**
    * Go back to your browser and refresh the website.
    * Despite removing the outbound rule, the website is still accessible. This is because security groups are stateful and automatically allow return traffic for connections initiated from outside the instance.

![alt text](<Screenshot 2025-08-05 145459.png>)
![alt text](<Screenshot 2025-08-05 145543.png>)
![alt text](<Screenshot 2025-08-05 145611.png>)
---

## Part 2: Exploring Network ACLs

In this section, we'll examine the behavior of Network ACLs (NACLs) by creating and associating one with a subnet.

### Scenario 1: Creating and Associating a NACL

**Description:** We will create a new NACL, but we won't configure any rules initially. The default behavior is to deny all traffic.

* **Step 1: Create a NACL**
    * In the AWS console, search for **VPC**.
    * Navigate to **Network ACLs** and click **Create network ACL**.
    * Provide a name and select your VPC.

* **Step 2: Edit Subnet Associations**
    * Select your new NACL.
    * Click **Actions > Edit subnet associations**.
    * Choose the public subnet where your EC2 instance resides.
    * Click **Save changes**.
![alt text](<Screenshot 2025-08-05 152200.png>)

![alt text](<Screenshot 2025-08-05 152327.png>) ![alt text](<Screenshot 2025-08-05 152345.png>) ![alt text](<Screenshot 2025-08-05 152258.png>)
### Scenario 2: NACL's Stateless Behavior
**Description:** Even with the SG allowing inbound HTTP traffic, the website is not accessible because the NACL is denying all traffic by default.

* **Step 1: Add Inbound and Outbound Rules**
    * Select your NACL and navigate to the **Inbound Rules** tab.
    * Click **Edit inbound rules** and add a rule to allow all traffic (Type: All Traffic, Source: `0.0.0.0/0`).
    * Similarly, go to the **Outbound Rules** tab, click **Edit outbound rules**, and add a rule to allow all traffic (Type: All Traffic, Destination: `0.0.0.0/0`).
    * Click **Save changes** on both tabs.

* **Step 2: Test Connectivity**
    * Refresh the website in your browser.
    * The website is now accessible. This proves that because NACLs are stateless, both inbound and outbound rules must be explicitly defined to allow traffic.

![alt text](<Screenshot 2025-08-05 152506.png>)
![alt text](<Screenshot 2025-08-05 153408.png>)
### Scenario 3: NACL vs. Security Group Priority

**Description:** Let's observe what happens when the Security Group and NACL rules conflict. We will configure the SG to allow HTTP traffic but the NACL to deny all inbound traffic.

* **Step 1: Configure Rules**
    * Make sure your Security Group still allows inbound HTTP traffic.
    * Go to your NACL and remove the inbound rule that allows all traffic. Keep the outbound rule in place.

* **Step 2: Test Connectivity**
    * Try to access the website again.
    * The website is not accessible. This demonstrates that the NACL acts as the first line of defense. If the NACL denies traffic, it never reaches the Security Group to be evaluated.

![alt text](<Screenshot 2025-08-05 154142.png>)
![alt text](<Screenshot 2025-08-05 154256.png>)

![alt text](<Screenshot 2025-08-05 154413.png>) ![alt text](<Screenshot 2025-08-05 154513.png>) ![alt text](<Screenshot 2025-08-05 154527.png>)
![alt text](<Screenshot 2025-08-05 151026-1.png>)
---

## Project Reflection

This project successfully demonstrated the core differences between Security Groups and NACLs. I learned that:
* Security groups are **stateful** and control traffic at the instance level.
* NACLs are **stateless** and control traffic at the subnet level, acting as a network firewall.
* NACLs are evaluated **before** Security Groups for incoming traffic, meaning a deny rule in a NACL will always override a corresponding allow rule in a Security Group.

This understanding is crucial for designing a secure and well-architected network on AWS.