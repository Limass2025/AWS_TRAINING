# Amazon S3 Project Submission
## Executive Summary
This project documents the hands-on process of working with Amazon S3 (Simple Storage Service), a core AWS service for object storage. Participants gained practical experience by creating and configuring an S3 bucket, managing object versioning, setting permissions, and implementing lifecycle policies. The goal was to build a foundational understanding of S3's capabilities and best practices for data management, security, and cost optimization.

## Project Overview
Scenario: This project focuses on the practical application of Amazon S3, a vital component of the AWS ecosystem. The exercises are designed to familiarize you with S3's fundamental concepts and management tools.

Objective: The primary goal is to familiarize participants with Amazon S3 (Simple Storage Service) and its fundamental concepts. Participants will learn how to create and manage S3 buckets, upload objects, enable versioning, set permissions for public access, and implement lifecycle policies.

## Learning Outcomes:

By the end of this project, participants will have gained practical experience in working with Amazon S3 and will be able to:

Create and configure S3 buckets using the AWS Management Console.

Upload files and manage objects within S3 buckets.

Understand the importance of versioning and its implications for data management.

Configure permissions to control access to S3 objects.

Implement lifecycle policies to automate data management tasks and optimize storage costs.

# Step-by-Step Guide
This section provides a detailed, step-by-step guide to replicate the project's hands-on implementation. Screenshots should be captured and placed at the designated points to document the process.

## **Step 1:** 
  *  Navigate to the S3 Dashboard
Log into your AWS Management Console.

 *  Use the search bar at the top of the console and search for "S3".

 * Click on the S3 service to navigate to the S3 Dashboard.
![alt text](<Screenshot 2025-08-04 115105.png>)

![alt text](<Screenshot 2025-08-04 115135.png>)


## **Step 2:**
 * Create a New S3 Bucket
On the S3 Dashboard, click the "Create bucket" button.

 *  Provide a unique name for your bucket.

 *  For Object Ownership, select "ACLs disabled (recommended)".

 *  Ensure the "Block all public access" setting is checked, as this is the default and a security best practice.

 *  Leave Bucket Versioning disabled for now.

 *  Click the "Create bucket" button.
![alt text](<Screenshot 2025-08-04 115355.png>)

![alt text](<Screenshot 2025-08-04 115409.png>)
![alt text](<Screenshot 2025-08-04 115535.png>)
![alt text](<Screenshot 2025-08-04 120820.png>)

## **Step 3:** 
 *  Upload an Object to the Bucket
 *  Click on the new bucket you just created to go inside it.

 *  Click the "Upload" button.

 *  Click "Add files" and select a file from your computer to upload.

 *  Click the "Upload" button in the lower right corner to start the upload process.

![alt text](<Screenshot 2025-08-04 121307.png>)

![alt text](<Screenshot 2025-08-04 121323.png>)
![alt text](<Screenshot 2025-08-04 121354.png>)
![alt text](<Screenshot 2025-08-04 121415.png>)

## **Step 4:** 
 *  Enable Versioning for the Bucket
 *  Navigate back to your bucket's main page.

 * Click on the Properties tab.

 *  Scroll down to the Bucket Versioning section and click "Edit".

 *  Select "Enable" and click "Save changes".

 *  Now, try uploading a new version of the same file from Step 3. You will see both versions retained in the bucket.
![alt text](<Screenshot 2025-08-04 125152.png>)

![alt text](<Screenshot 2025-08-04 125355.png>)
![alt text](<Screenshot 2025-08-04 125512.png>)

## **Step 5:**
 *  Configure Permissions for Public Access
 *  Navigate to your bucket's main page and click on the Permissions tab.

 *  To demonstrate public access, you will need to edit the Block all public access settings.

 * Click "Edit" and uncheck the box for "Block all public access". Confirm the change.

 * In the Bucket Policy section, click "Edit" to create a policy that grants public read access to all objects.
![alt text](<Screenshot 2025-08-04 125607.png>)
![alt text](<Screenshot 2025-08-04 125625.png>)



## **Step 6:** 
 * Implement a Lifecycle Policy
Navigate back to your bucket's main page and click on the Management tab.

 * In the Lifecycle rules section, click "Create lifecycle rule".

 * Name your rule and choose whether to apply it to all objects or a filtered set.

 * Select actions such as moving objects to a lower-cost storage class or deleting them after a certain number of days.

 * Click "Create rule".
![alt text](<Screenshot 2025-08-04 125707.png>)
![alt text](<Screenshot 2025-08-04 130359.png>)
![alt text](<Screenshot 2025-08-04 130431.png>)
![alt text](<Screenshot 2025-08-04 130539.png>)
![alt text](<Screenshot 2025-08-04 130615.png>)
![alt text](<Screenshot 2025-08-04 130637.png>)
![alt text](<Screenshot 2025-08-04 130710.png>)
![alt text](<Screenshot 2025-08-04 130850.png>)
![alt text](<Screenshot 2025-08-04 130928.png>)
![alt text](<Screenshot 2025-08-04 131336.png>)
![alt text](<Screenshot 2025-08-04 131524.png>)
![alt text](<Screenshot 2025-08-04 131602.png>)

## **Project Reflection**
 *  Gained hands-on experience with Amazon S3, a core service of AWS.

 *  Managed S3 buckets and objects, learning key concepts like versioning, permissions management, and lifecycle policies.

 *  Through practical tasks, participants developed a solid understanding of S3 features.

 *  Learned to optimize storage costs and ensure data reliability and accessibility using AWS features.

 *  This project equipped participants with valuable skills applicable to real-world scenarios.