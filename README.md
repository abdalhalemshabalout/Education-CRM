# Education-CRM
JAVA - Servlet - JSP - MYSQL  - Eclipse 

# Project Setup Guide

This guide will walk you through setting up a Java web project using Eclipse IDE, Apache Tomcat, and MySQL Workbench.

## Prerequisites

- Eclipse IDE (https://www.eclipse.org/)
- Apache Tomcat (https://tomcat.apache.org/)
- MySQL Workbench (https://www.mysql.com/products/workbench/)

## Steps

### 1. Install Eclipse

Download and install Eclipse IDE for Java EE Developers from the [Eclipse Downloads](https://www.eclipse.org/downloads/) page.

### 2. Install Tomcat and Add to Eclipse

Download Apache Tomcat from the [Apache Tomcat](https://tomcat.apache.org/download-90.cgi) website. Follow the installation instructions.

To add Tomcat to Eclipse:
- Open Eclipse IDE.
- Go to `Window > Preferences`.
- In the Preferences dialog, expand `Server` and select `Runtime Environments`.
- Click `Add...`, choose `Apache Tomcat`, and provide the path to your Tomcat installation directory.

### 3. Add Java EE to Eclipse

Java EE support is included in Eclipse IDE for Java EE Developers. If you're using a different version of Eclipse, you may need to install Java EE tools via the Eclipse Marketplace.

### 4. Import the Project to Eclipse

- Clone or download the project repository from GitHub.
- In Eclipse, go to `File > Import`.
- Select `Existing Projects into Workspace` under the `General` folder.
- Browse to the location of your project and click `Finish`.

### 5. Import Database to MySQL Workbench

- Open MySQL Workbench.
- Connect to your MySQL server.
- Import the database by going to `File > Import > Reverse Engineer...` and follow the prompts to import your database schema.

### 6. Create New Server on Eclipse and Run

- In Eclipse, go to the `Servers` view (if not visible, go to `Window > Show View > Servers`).
- Right-click in the Servers view and select `New > Server`.
- Choose `Apache > Tomcat` and click `Next`.
- Select the Tomcat installation directory and click `Finish`.
- Right-click on the newly created server and select `Add and Remove...`.
- Add your project to the Configured projects list and click `Finish`.
- Finally, right-click on the server and select `Start`.

## Conclusion

Your project should now be set up and running. You can access it by navigating to `http://localhost:8080/` in your web browser.
