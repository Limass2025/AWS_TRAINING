This submission outlines the steps for setting up and configuring an AWS Virtual Private Cloud (VPC), including subnets, internet gateways, NAT gateways, and VPC peering connections.

---

## Network Mastery with AWS VPC Mini Project

This project demonstrates the practical steps involved in setting up a robust and secure network infrastructure within AWS using Virtual Private Cloud (VPC).

---

### Part 1: Setting Up a Virtual Private Cloud (VPC)

1.  **Navigate to the Search Bar:**
    * Enter "VPC" in the AWS services search bar.
    * Click on the "VPC" service when it appears in the search results.

   ![alt text](<Screenshot 2025-08-04 165705.png>)

2.  **Click "Create VPC":**
    * On the VPC dashboard, locate and click the "Create VPC" button.

   
![alt text](<Screenshot 2025-08-04 170055.png>)
3.  **Configure and Create VPC:**
    * Select the "**VPC only**" option.
    * Specify your **IPv4 CIDR block** (e.g., `10.0.0.0/16`). *Note: The CIDR block size must be between "/16" and "/28".*
    * Click the "**Create VPC**" button.

![alt text](<Screenshot 2025-08-04 170323.png>)

    * Confirmation that the VPC has been successfully created.

   

---

### Part 2: Configuring Subnets within the VPC

(The provided text only shows subnet creation in Part 5 for NAT Gateway, but a separate subnet creation step would typically precede Part 3. Assuming the original prompt intended separate creation before NAT Gateway setup.)

*Note: For a complete setup, you would typically create both a public and a private subnet at this stage, ensuring distinct naming conventions (e.g., `my-public-subnet-1`, `my-private-subnet-1`) and appropriate IPv4 CIDR blocks and Availability Zones.*

1.  **Navigate to Subnets:**
    * From the VPC dashboard, click on "Subnets" in the left-hand navigation pane.
2.  **Create a Public Subnet:**
    * Click "Create subnet."
    * Select your newly created VPC.
    * Provide a **subnet name** (e.g., `my-public-subnet-1`).
    * Choose an **Availability Zone**.
    * Provide an **IPv4 CIDR** block (e.g., `10.0.6.0/24`).
    * Click "Create subnet."
3.  **Create a Private Subnet:**
    * Repeat the steps for the second subnet.
    * Provide a **subnet name** (e.g., `my-private-subnet-1`).
    * Choose a different **Availability Zone** or the same one as your public subnet, depending on your architecture.
    * Provide an **IPv4 CIDR** block (e.g., `10.0.7.0/24`).
    * Click "Create subnet."

  ![alt text](<Screenshot 2025-08-04 170350.png>)
  ![alt text](<Screenshot 2025-08-04 170911.png>)
![alt text](<Screenshot 2025-08-04 170924.png>)
  ![alt text](<Screenshot 2025-08-04 171056.png>)
---

### Part 3: Creating Internet Gateway and Attaching it to VPC

1.  **Navigate to Internet Gateways:**
    * On the left sidebar of the VPC dashboard, click on "Internet Gateways."
    * On the Internet Gateways page, click "Create Internet Gateway."

 ![alt text](<Screenshot 2025-08-04 171545.png>)

2.  **Specify Internet Gateway Name:**
    * Provide a **name** for your Internet Gateway.
    * Click the "**Create Internet Gateway**" button.

   ![alt text](<Screenshot 2025-08-04 171618.png>)
![alt text](<Screenshot 2025-08-04 171651.png>)

3.  **Attach to VPC:**
    * Once created, select your new Internet Gateway.
    * Click on "Actions" and choose "Attach to VPC."
    * Select your created VPC from the dropdown list and click "Attach Internet Gateway."

    ![alt text](<Screenshot 2025-08-04 171720.png>)

---

### Part 4: Enabling Internet Connectivity with the Internet Gateway by Setting Up Routing Tables

1.  **Navigate to Route Tables:**
    * Go to "Route Tables" on the left sidebar of the VPC dashboard.
    * Click the "**Create route table**" button.

  ![alt text](<Screenshot 2025-08-04 171750.png>)

2.  **Create Route Table:**
    * Enter a **name** for your route table (e.g., `public-route-table`).
    * Select the **VPC** you previously created.
    * Click the "**Create route table**" button.

  ![alt text](<Screenshot 2025-08-04 171839.png>)
  ![alt text](<Screenshot 2025-08-04 171949.png>)


3.  **Associate Public Subnet:**
    * Select the newly created public route table.
    * Navigate to the "**Subnet associations**" tab.
    * Click "**Edit subnet associations**."
    * Choose your **public subnet** and click "**Save associations**."
![alt text](<Screenshot 2025-08-04 172005.png>)

4.  **Edit Routes for Internet Gateway:**
    * With the public route table still selected, navigate to the "**Routes**" tab.
    * Click "**Edit routes**."
    * Click "**Add route**."
    * For **Destination**, enter "**0.0.0.0/0**" (indicating all IPv4 addresses).
    * For **Target**, choose "**Internet Gateway**" and select the Internet Gateway you created.
    * Click "**Save changes**."

   ![alt text](<Screenshot 2025-08-04 172049.png>)
   ![alt text](<Screenshot 2025-08-04 172159.png>)
   ![alt text](<Screenshot 2025-08-04 172212.png>)

---

### Part 5: Enabling Outbound Internet Access through NAT Gateway

1.  **Navigate to NAT Gateways:**
    * On the left sidebar, click on "NAT Gateways."
    * Click "**Create NAT Gateway**."

   ![alt text](<Screenshot 2025-08-04 172326.png>)

2.  **Configure NAT Gateway:**
    * Mention the **name** of the NAT Gateway (e.g., `my-NAT-gw-1`).
    * Choose the **public subnet** for the NAT Gateway to reside in.
    * Select **Connectivity type** as "Public." (The prompt mentions "Private" but a NAT Gateway typically needs to be in a public subnet with an Elastic IP for outbound internet access from private subnets.)
    * Allocate an **Elastic IP address** (or choose an existing one).
    * Click "**Create NAT Gateway**."
![alt text](<Screenshot 2025-08-04 172503.png>)
   
    * Confirmation that the NAT Gateway is being created successfully.

   ![alt text](<Screenshot 2025-08-04 172532.png>)
3.  **Find NAT Gateway Subnet Details:**
    * Select your newly created NAT Gateway.
    * Navigate to the "**Details**" tab.
    * Locate the **Subnet ID** associated with the NAT Gateway and click on it.

    ![alt text](<Screenshot 2025-08-04 172713.png>)

4.  **Locate Private Subnet's Route Table:**
    * On the subnet page (the one where the NAT Gateway is associated), navigate to the "**Route Table**" section.
    * Click on the **route table ID** associated with your *private subnet* (this is the route table we need to update to route private subnet traffic through the NAT Gateway).
![alt text](<Screenshot 2025-08-04 172905.png>)
![alt text](<Screenshot 2025-08-04 172925.png>)
   

5.  **Edit Private Route Table to Use NAT Gateway:**
    * In the private route table details, proceed to the "**Routes**" section.
    * Click "**Edit routes**."
    * Click "**Add route**."
    * Select **Destination** as "**0.0.0.0/0**."
    * In the **Target** field, choose "**NAT Gateway**," and then select the NAT Gateway you created.
    * Finally, "**Save changes**."

![alt text](<Screenshot 2025-08-04 173008.png>)
![alt text](<Screenshot 2025-08-04 173142.png>)

6.  **Verify Private Subnet Association:**
    * On the private route table details page, navigate to the "**Subnet associations**" section.
    * Click on "**Edit subnet associations**."
    * Ensure your **private subnet** is selected and click "**Save associations**."

   ![alt text](<Screenshot 2025-08-04 173239.png>)

---

### Part 6: Establishing VPC Peering Connections

**Understanding VPC Peering:** VPC peering is like connecting two virtual offices in the cloud directly. It allows EC2 instances in different VPCs to communicate with each other using private IP addresses.

1.  **Navigate to Peering Connections:**
    * Create two different VPC name "Requester" and "Accepter" respectively.

    ![alt text](<Screenshot 2025-08-04 173747.png>)
    ![alt text](<Screenshot 2025-08-04 173902.png>)
    * On the left sidebar of the VPC dashboard, click on "Peering Connections."
    * Click the "**Create Peering Connection**" button.

    ![alt text](<Screenshot 2025-08-04 173913.png>)

2.  **Configure Peering Connection:**
    * Provide a **name** for the VPC peering connection (e.g., `my-1st-VPC-peering`).
    * Select the **Requester VPC**.
    * Choose the account "**My account**" (assuming VPCs are in the same AWS account).
    * Ensure to use "**This Region**" (e.g., `ap-southeast-1`) as the VPCs are in the same region.
    * Select the **Accepter VPC**.
    * Proceed by clicking on the "**Create Peering Connection**" button.

   ![alt text](<Screenshot 2025-08-04 174025.png>)

    * You will see a confirmation that the peering connection has been requested.

    ![alt text](<Screenshot 2025-08-04 174051.png>)

3.  **Accept Peering Connection Request:**
    * In the Peering Connection page, locate the "**Actions**" dropdown on the right side.
    * Click on it, then select "**Accept Request**."

    ![alt text](<Screenshot 2025-08-04 174107.png>)
    * A confirmation message will appear stating the VPC peering connection has been established.

    

4.  **Update Requester VPC's Route Table:**
    * Go to the VPC dashboard and select your **Requester VPC**.
    * In the details tab, find and copy the **IPv4 CIDR** of the Requester VPC (e.g., `192.168.0.0/16`).
    * Navigate to the **main route table ID** associated with the **Requester VPC**.
    * Go to the "**Routes**" section and click "**Edit routes**."
    * Click "**Add route**."
    * Paste the **Accepter VPC's CIDR** (e.g., `172.16.0.0/16`) into the "**Destination**" field.
    * In the **Target**, choose "**VPC Peering Connection**" and select the peering connection you created.
    * Click "**Save changes**."
![alt text](<Screenshot 2025-08-04 201725.png>)
![alt text](<Screenshot 2025-08-04 201819.png>)
![alt text](<Screenshot 2025-08-04 201852.png>)
5.  **Update Accepter VPC's Route Table:**
    * Go to the VPC dashboard and select your **Accepter VPC**.
    * In the details tab, find and copy the **IPv4 CIDR** of the Accepter VPC (e.g., `172.16.0.0/16`).
    * Navigate to the **main route table ID** associated with the **Accepter VPC**.
    * Go to the "**Routes**" section and click "**Edit routes**."
    * Click "**Add route**."
    * Paste the **Requester VPC's CIDR** (e.g., `192.168.0.0/16`) into the "**Destination**" field.
    * In the **Target**, choose "**VPC Peering Connection**" and select the peering connection you created.
    * Click "**Save changes**."
![alt text](<Screenshot 2025-08-04 201156.png>)
    ![alt text](<Screenshot 2025-08-04 201539.png>)
   ![alt text](<Screenshot 2025-08-04 201630.png>)
![alt text](<Screenshot 2025-08-04 201706.png>)
---

### Project Reflection

This project provided invaluable hands-on experience in configuring AWS VPC infrastructure. We successfully set up a VPC, created both public and private subnets, established internet connectivity using an Internet Gateway, enabled outbound access from private subnets via a NAT Gateway, and facilitated inter-VPC communication through VPC Peering.

Challenges such as understanding CIDR block limitations and correctly associating route tables were overcome through careful troubleshooting and a deeper dive into AWS networking concepts. This practical application significantly enhanced our understanding of network architecture, security best practices (like using NAT Gateways and the future implications of VPC Endpoints), and the fundamental components of cloud networking on AWS.

Overall, this mini-project was instrumental in developing practical skills and theoretical knowledge essential for deploying and managing secure and efficient cloud environments.