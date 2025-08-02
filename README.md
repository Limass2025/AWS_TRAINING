# AWS Identity and Access Management Mini-Project: GitFile Submission

This document details the step-by-step implementation of an AWS Identity and Access Management (IAM) mini-project. The project aims to provide practical experience in controlling access to AWS resources using IAM users, groups, and policies.

## Project Goals & Learning Outcomes

**Project Goals:**
* Understand AWS Identity and Access Management (IAM) principles and components.
* Learn to create and manage IAM policies for regulating access to AWS resources securely.
* Apply IAM concepts practically to control access within AWS environments.
* Explore best practices for IAM implementation and security in AWS.

**Learning Outcomes:**
* Recognize IAM components like users, roles, policies, and groups.
* Create and manage IAM policies to define permissions for users and roles.
* Set up IAM users, groups, and roles to control access to AWS services.
* Understand IAM best practices for maintaining security and managing access to AWS resources.

---

## Part 1: Individual User and Policy Creation

This section focuses on creating a custom policy and assigning it directly to an individual IAM user.

### Step 1: Navigate to the AWS Management Console

* **Action:** Log in to your AWS Management Console. Use the search bar to locate and navigate to the Identity and Access Management (IAM) service.

![alt text](<Screenshot 2025-08-01 053451.png>)
![alt text](<Screenshot 2025-08-02 143308.png>)

### Step 2: Initiate Policy Creation

* **Action:** On the IAM dashboard, navigate to the left sidebar and click on "Policies."
* **Action:** While the instruction states to search for "EC2" and select "Amazon EC2FullAccess," for the purpose of creating a *new custom policy* as indicated by `policy_for_eric`, we will proceed by clicking on "Create policy" directly from the Policies page.
![alt text](<Screenshot 2025-08-02 143408.png>)

### Step 3: Select EC2 Actions

* **Action:** In the policy creation interface, choose the service "EC2." Then, under "Actions," select "All EC2 actions" to grant full access to EC2 resources.
![alt text](<Screenshot 2025-08-02 144706.png>)
 
### Step 4: Specify Resources

* **Action:** Under the "Resources" section, tick "All resources" to apply this policy to all EC2 resources. Then, click "Next."

![alt text](<Screenshot 2025-08-02 144841.png>)

### Step 5: Review and Create Policy

* **Action:** Review the policy configuration. Provide a name for the policy (e.g., `policy_for_eric`) and an optional description. Then, click "Create policy."

 

* **Observation:** The newly created policy, `policy_for_eric`, is now visible in your list of customer managed policies.

![alt text](<Screenshot 2025-08-02 144901.png>)

### Step 6: Proceed to Create User

* **Action:** Now, navigate to the "Users" section in the left sidebar, and select the option to "Create User."

![alt text](<Screenshot 2025-08-02 144929.png>)
### Step 7: Configure User Details

* **Action:** Enter the desired username for the user (e.g., "Eric").
* **Action:** Select the option "Provide user access to the AWS Management Console" if web-based console interface access is required.
* **Action:** Proceed to set up a password for the user.
* **Action:** Check the box "Users must create a new password at next sign-in" if allowing users to change their password upon first sign-in is preferred.
![alt text](<Screenshot 2025-08-02 145036.png>)

### Step 8: Attach Policy Directly

* **Action:** In the "Set permissions" step, select "Attach policy directly."
* **Action:** Navigate to "Filter customer managed policies."
* **Action:** Choose the policy you created named `policy_for_eric`.
* **Action:** Then proceed by clicking "Next."
![alt text](<Screenshot 2025-08-02 145101.png>)

    *Note:* AWS policies come in different types:
    * **AWS Managed Policies:** Created and managed by AWS, ready for immediate use.
    * **Customer Managed Policies:** Created and managed by you, offering fine-grained control.
    * **Inline Policies:** Embedded directly into a single IAM user, group, or role, and are deleted when the entity is deleted.

### Step 9: Review and Create User

* **Action:** Review all the user details and permissions. Then, click on "Create User."
![alt text](<Screenshot 2025-08-02 145146.png>)

### Step 10: Save User Credentials

* **Action:** Ensure to save the login URL, username, and initial password securely for future reference.
* **Action:** Click on "Return to user list."

     ![alt text](<Screenshot 2025-08-02 145200.png>)

* **Observation:** Eric's user has been successfully created, and the `policy_for_eric` granting him full access to EC2 has been attached.

---

## Part 2: User Groups and Group Policy Creation

This section demonstrates how to create user groups and attach policies to groups for efficient management of permissions across multiple users.

### Step 1: Create a User Group

* **Action:** On the IAM dashboard, navigate to the "User Groups" section in the left sidebar.
* **Action:** Enter a name for the group (e.g., `development-team`).
* **Action:** Click on "Create User Group."

* **Observation:** The newly created user group, `development-team`, is now visible.

    ![alt text](<Screenshot 2025-08-02 145613.png>)
![alt text](<Screenshot 2025-08-02 145657.png>)
### Step 2: Navigate to Users Section

* **Action:** Proceed to the "Users" section in the left sidebar to create new users for the group.

### Step 3: Create User "Jack"

* **Action:** Click "Create user." Enter "Jack" as the username. Configure console access and password as done for Eric.

  
### Step 4: Add User "Jack" to Group

* **Action:** In the "Permissions" options, select "Add user to group."
* **Action:** In the "User groups" section, choose the group you created named `development-team`.
* **Action:** Click "Next" to proceed to review, then "Create user."

 * **Action:** Click on "Create user" to finalize Jack's creation.


### Step 5: Create User "Ade" and Add to Group

* **Action:** Repeat the same process for user Ade. Create user "Ade" and add him to the user group `development-team`.
![alt text](<Screenshot 2025-08-02 145734.png>)

![alt text](<Screenshot 2025-08-02 145745.png>)

![alt text](<Screenshot 2025-08-02 145757.png>)
### Step 6: Create a New Policy for Development Team

* **Action:** Navigate back to the "Policies" section and click on "Create Policy" to begin crafting a new policy that will grant access to multiple services.
![alt text](<Screenshot 2025-08-02 145820.png>)

### Step 7: Select EC2 and S3 Services

* **Action:** In the policy creation interface, choose "EC2" and "S3" from the available services.
* **Action:** For both services, select "All actions" and "All resources" for simplicity in this example.
![alt text](<Screenshot 2025-08-02 150014.png>)

### Step 8: Name and Create Development Policy

* **Action:** Enter the desired policy name (e.g., `development-policy`) and proceed to click on the "Create policy" button.
![alt text](<Screenshot 2025-08-02 150029.png>)
![alt text](<Screenshot 2025-08-02 150207.png>)
### Step 9: Attach Policy to Development Team Group

* **Action:** Navigate to the "User groups" section and select the `development-team` group.

   ![alt text](<Screenshot 2025-08-02 150207-1.png>)

### Step 10: Add Permissions to Group

* **Action:** Proceed to the "Permissions" tab within the `development-team` group details.
* **Action:** Click on "Add permissions."
![alt text](<Screenshot 2025-08-02 150225.png>)

### Step 11: Attach Customer Managed Policy

* **Action:** Select "Attach policies."
* **Action:** Filter by "Customer managed" policies.
* **Action:** Then choose the `development-policy` you created.
* **Action:** Click "Attach Policy."

    ![alt text](<Screenshot 2025-08-02 150310.png>)

* **Observation:** The `development-policy` is now attached to the `development-team` group, granting full permissions to EC2 and S3 for all users in the group (Jack and Ade).

    ![alt text](<Screenshot 2025-08-02 150310-1.png>)

---

## Project Reflection

This mini-project provided a comprehensive hands-on experience with AWS Identity and Access Management (IAM), covering fundamental concepts and practical applications.

* **Understanding IAM:** We gained a clear understanding that IAM serves as the security foundation for AWS resources, meticulously controlling who can access what and with what level of permission. It acts as the central gatekeeper, ensuring operations are secure and authorized.
* **Security Importance:** The project highlighted the critical importance of IAM in ensuring data protection, maintaining compliance with various regulations, and fundamentally preventing unauthorized access to sensitive cloud resources. Proper IAM implementation is a cornerstone of a robust cloud security posture.
* **Policy Creation:** Participants learned the essential skill of crafting IAM policies, which are the core documents that define permissions. This involved specifying services, actions, and resources, enabling precise regulation of resource access effectively.
* **Practical Application:** Through hands-on exercises, participants were equipped with the practical skills to set up IAM users (like Eric, Jack, and Ade) and user groups (like `development-team`). They also learned to attach specific policies to these entities, thereby demonstrating real-world IAM implementation skills for controlling access within AWS environments. The distinction between individual policy attachment and group-based policy management was clearly illustrated, emphasizing efficiency for scaling teams.