This GITFILE SUBMISSION provides a comprehensive overview of Infrastructure Environments, Environment Variables, and their application in shell scripting, specifically using command-line arguments to create a dynamic `aws_cloud_manager.sh` script.

-----

### Part 1: Understanding Infrastructure Environments vs. Environment Variables

  * **Infrastructure Environments** are the distinct settings where software is developed, tested, and deployed. They are large-scale, physical, or virtual setups like **development**, **testing**, or **production**. Each environment serves a specific purpose in the software lifecycle and typically involves separate cloud accounts or hardware to prevent one from affecting another.

  * **Environment Variables** are **key-value pairs** that store configuration values within a script or operating system. They are small, dynamic configurations that allow scripts to behave differently without code changes. For example, a script can read an environment variable like `DB_URL` to connect to a different database depending on whether it's running in the development or production environment.

### Part 2: Developing the `aws_cloud_manager.sh` Script

The project uses a shell script, `aws_cloud_manager.sh`, to demonstrate how to use these concepts. The goal is to make the script flexible enough to be used across different environments without being "hard-coded."

1.  **Create the Script File:**

      * Create a new file named `aws_cloud_manager.sh` using a text editor (e.g., `nano aws_cloud_manager.sh`).

2.  **Add Initial Script Code:**

      * Start with a basic script that checks for an `ENVIRONMENT` variable using an `if-elif-else` statement.

    <!-- end list -->

    ```bash
    #!/bin/bash
    # Checking and acting on the environment variable
    if [ "$ENVIRONMENT" == "local" ]; then
        echo "Running script for Local Environment..."
    elif [ "$ENVIRONMENT" == "testing" ]; then
        echo "Running script for Testing Environment..."
    elif [ "$ENVIRONMENT" == "production" ]; then
        echo "Running script for Production Environment..."
    else
        echo "No environment specified or recognized."
        exit 2
    fi
    ```

3.  **Make the Script Executable:**

      * Grant the script execution permissions.
        `sudo chmod +x aws_cloud_manager.sh`

4.  **Using `export` for Environment Variables:**

      * To run the script for a specific environment, you can set the `ENVIRONMENT` variable in your terminal using the `export` command, which makes it available to child processes (like your script).
        `export ENVIRONMENT=production`
      * Now, when you run `./aws_cloud_manager.sh`, the script will print `Running script for Production Environment...`.

    ![alt text](<WhatsApp Image 2025-08-10 at 01.37.53_1c5c82e1.jpg>)

-----

### Part 3: Using Positional Parameters for Dynamic Control

Hard-coding values or relying on `export` can be inefficient. A better approach is to use **positional parameters**, which are values passed to the script as arguments when it's executed.

1.  **Update the Script with Positional Parameters:**

      * Modify the script to accept an argument and assign it to the `ENVIRONMENT` variable using `$1`.
      * **`$0`** represents the script's name.
      * **`$1`** represents the first argument.
      * **`$#`** represents the total number of arguments.

    <!-- end list -->

    ```bash
    #!/bin/bash
    # Checking the number of arguments
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi

    # Accessing the first argument
    ENVIRONMENT=$1

    # Acting based on the argument value
    if [ "$ENVIRONMENT" == "local" ]; then
        echo "Running script for Local Environment..."
    elif [ "$ENVIRONMENT" == "testing" ]; then
        echo "Running script for Testing Environment..."
    elif [ "$ENVIRONMENT" == "production" ]; then
        echo "Running script for Production Environment..."
    else
        echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
        exit 2
    fi
    ```

2.  **Add a Check for Argument Count:**

      * The `if [ "$#" -ne 1 ]` block is a **best practice** for robust scripting. It ensures that the script only runs if exactly one argument is provided, preventing unexpected behavior and providing a helpful usage message.

3.  **Execute the Script with Arguments:**

      * Now, you can run the script dynamically by passing the environment name as a command-line argument.
        `./aws_cloud_manager.sh testing`
      * The script will now print `Running script for Testing Environment...`.
      * You can easily change the environment by changing the argument: `./aws_cloud_manager.sh production`

    ![alt text](<WhatsApp Image 2025-08-10 at 01.37.29_b05f2647.jpg>)
    ![alt text](<WhatsApp Image 2025-08-10 at 02.28.00_794e5132.jpg>)

    ![alt text](<WhatsApp Image 2025-08-10 at 02.28.13_619775b5.jpg>)

-----

### Project Summary
This mini-project provided a clear distinction between **Infrastructure Environments** and **Environment Variables**. I learned that infrastructure environments, such as local, testing, and production, are distinct settings for software deployment, while environment variables are dynamic key-value pairs used within those environments to manage configurations like database credentials. The project demonstrated how to build a flexible shell script by avoiding hard-coding and instead using **positional parameters** (e.g., `$1`, `$2`) to accept command-line arguments. This approach allows a single script to be reusable across different environments. I also learned the importance of robust scripting by using the `$#` special variable to check for the correct number of arguments, ensuring the script is executed properly and providing helpful feedback to the user.
