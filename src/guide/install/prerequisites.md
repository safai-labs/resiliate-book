# Prerequisites

<!-- - RAM 16GB (minimum) -->
| Hardware OR Virtual Machine | Recommendation   |
|-----------------------------|------------------|
| **CPU**                     | 2.0GHz Dual Core x86_64 |
| **RAM**                     | 4GB (8GB Recommended) |
| **DISK**                    | 40GB for root and 100 GB for data mounted at `/srv/cefs`|

- Administration access
- One of the supported Linux Servers:
  - [Ubuntu Server 22.04 LTS (x86_64, 64-bit)](https://www.ubuntu.com/download/server)
   **Recommended**
  - [Ubuntu Server 20.04 LTS (x86_64, 64-bit)](https://www.ubuntu.com/download/server)
  - [CentOS 8 (x86_64, 64-bit)](https://www.centos.org/download/)
- Data transfer utility software:
  - cURL **Recommended**
    - Ubuntu Server 22.04 & 20.04 LTS:

    ``` bash
    sudo apt-get install curl
    ```

    - Red Hat Enterprise Linux 8 // CentOS 8 Server:

    ``` bash
    sudo yum install curl
    ```

  - Wget

    - Ubuntu Server 22.04 & 20.04 LTS:

    ``` bash
    sudo apt-get install wget
    ```

    - Red Hat Enterprise Linux 8 // CentOS 8 Server:

    ``` bash
    sudo yum install wget
    ```
