# 🚀 Enterprise IT Infrastructure & Automation Lab

<p align="center">
  <em>A comprehensive homelab project demonstrating end-to-end System Administration skills, from infrastructure setup with Active Directory to process automation with PowerShell.</em>
  <br/><br/>
  <img src="https://github.com/YShin044/IT-Helpdesk-ADlab/blob/master/assets/Lab_Architecture.png" alt="Lab Architecture">
</p>

<!-- TECHNOLOGY BADGES -->
<p align="center">
  <img src="https://img.shields.io/badge/Windows_Server-0078D4?style=for-the-badge&logo=windows-server&logoColor=white" alt="Windows Server"/>
  <img src="https://img.shields.io/badge/Active_Directory-005B9A?style=for-the-badge&logo=microsoft&logoColor=white" alt="Active Directory"/>
  <img src="https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell Automation"/>
  <img src="https://img.shields.io/badge/Group_Policy-Management-E34F26?style=for-the-badge&logoColor=white" alt="Group Policy"/>
  <img src="https://img.shields.io/badge/VMware-6C179C?style=for-the-badge&logo=vmware&logoColor=white" alt="VMware"/>
</p>
<!-- END BADGES -->

## ► Project Overview

This project simulates a complete IT ecosystem for a small corporation, built from the ground up within a virtualized environment. It is divided into two core pillars:

1.  **Infrastructure Foundation:** Building and managing the core network services using **Windows Server**, **Active Directory**, and **Group Policy**.
2.  **Operational Automation:** Developing a toolkit of **PowerShell scripts** to automate repetitive, time-consuming administrative tasks, thereby increasing efficiency and reducing human error.

This dual-focus approach demonstrates not only the ability to manage an existing system but also the forward-thinking mindset to improve and optimize IT operations.

---

## ► Part 1: Infrastructure Foundation (GUI & GPO)

This section covers the setup and management of the core IT infrastructure using standard graphical tools and Group Policy.

### 🏛️ Lab Environment & Architecture
- **Virtualization Platform:** VMware Workstation
- **Domain Controller (`DC01`):** Windows Server 2019 (`minhtam.server`)
- **Client Workstation (`CLIENT01`):** Windows 10 Pro (Domain-joined)

*(Note: The architecture diagram above represents a best-practice, scalable model. My current homelab implements the core components which serve as the foundation for this model.)*

### 🌳 Active Directory OU Structure
A hierarchical OU structure was designed for granular policy application and simplified delegation of control.

![Active Directory OU Structure](https://github.com/YShin044/IT-Helpdesk-ADlab/blob/master/assets/OU_Structure.png)

### 🛡️ Core Scenarios Implemented (via Group Policy)

#### Scenario 1.1: Security Hardening - USB Device Blocking
- **Objective:** To mitigate data leakage risks by blocking removable storage on all workstations.
- **Method:** Deployed a Computer-based GPO linked to the `Company\Computers` OU.
- **Verification:** `gpresult` confirmed policy application, and USB access was denied on the client.

| GPO Configuration | Result on Client (gpresult) |
|:---:|:---:|
| ![Block USB GPO Config](https://github.com/YShin044/IT-Helpdesk-ADlab/blob/master/assets/Block_USB_GPO%20Config.png) | ![gpresult Output](https://github.com/YShin044/IT-Helpdesk-ADlab/blob/master/assets/gpresult_output.png) |

#### Scenario 1.2: User Productivity - Automated Network Drive Mapping
- **Objective:** To automatically provide department-specific network shares to users upon login.
- **Method:** Deployed a User-based GPO using `Drive Maps` preferences, linked to departmental OUs.
- **Verification:** Sales users automatically received the 'S:' drive upon logging in.

| GPO Configuration | Result on Client |
|:---:|:---:|
| ![Mapped Drive GPO Config](https://github.com/YShin044/IT-Helpdesk-ADlab/blob/master/assets/Map_Drive_GPO_Config.png) | ![Mapped Drive Result](https://github.com/YShin044/IT-Helpdesk-ADlab/blob/master/assets/Mapped_Drive_Result.png) |

---

## ► Part 2: Operational Automation (PowerShell)

This section showcases a toolkit of PowerShell scripts developed to automate common Helpdesk tasks, demonstrating proficiency in scripting for system administration.

### 🧰 PowerShell Automation Toolkit

#### Scenario 2.1: Bulk User Onboarding from CSV
- **Objective:** To eliminate the manual, error-prone process of creating multiple user accounts during new employee onboarding.
- **Solution:** A PowerShell script that reads user data from a `.csv` file and automatically provisions их in the correct OU with pre-defined attributes.
- **Key Features:**
    - Imports data from a structured CSV.
    - Creates `ADUser` objects with specified names, departments, and passwords.
    - Converts plaintext passwords to SecureStrings for security.
    - Places each new user in the correct OU path defined in the CSV.
- **[View Script & Sample CSV](Automation-Scripts/Create_Users.ps1)**

#### Scenario 2.2: Bulk Password Reset
- **Objective:** To quickly and securely reset passwords for a list of users, for instance, after a potential security incident or a department-wide policy change.
- **Solution:** A script that takes a list of usernames from a `.csv` file, sets a new, strong temporary password for each, and forces a password change on next logon.
- **[View Script & Sample CSV](Automation-Scripts/Reset_Password.ps1)**

#### Scenario 2.3: Intelligent Logon Script for Drive Mapping
- **Objective:** To create a single, dynamic logon script that maps the correct network drives based on a user's group membership, superior to assigning multiple GPOs.
- **Solution:** A PowerShell logon script that checks the current user's security groups (`Sales_Users`, `HR_Users`, etc.) and maps the appropriate drives (`S:`, `H:`, etc.) accordingly.
- **Deployment:** This script is assigned via the "Logon script" field in a user's AD Profile tab, pointing to the file in the NETLOGON share.
- **[View Script](Automation-Scripts/Login_Scripts.ps1)**

---

## ► Key Skills & Concepts Demonstrated

This project showcases a holistic skill set essential for modern IT roles, covering both foundational concepts and advanced automation techniques.

- **System & Network Administration:**
  - **Active Directory DS:** Full-cycle management of the entire AD ecosystem.
  - **Core Network Services:** Hands-on experience with **DNS** and **DHCP**.
  - **File Server & Permissions:** Deep understanding of **NTFS vs. Share Permissions**.
- **Automation & Scripting:**
  - **PowerShell:** Proficient in writing scripts to interact with Active Directory, manage users, and automate system tasks.
  - **Data-Driven Operations:** Ability to use structured data (CSV) to perform tasks at scale.
- **Policy & Security Management:**
  - **Group Policy (GPO):** Expertise in creating, linking, and troubleshooting GPOs for both computer and user configurations to enforce security and company policies.
- **Problem-Solving & Efficiency:**
  - **Troubleshooting:** Using tools like `gpresult`, `gpupdate`, and PowerShell cmdlets to diagnose issues.
  - **Process Optimization:** Identifying manual processes and developing automated solutions to improve efficiency and reliability.

*This project represents a commitment to continuous learning and a practical understanding of the technologies and methodologies that underpin a modern, efficient, and secure IT infrastructure.*
