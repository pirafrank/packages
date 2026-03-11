# pirafrank's APT/YUM package repository

Home of my tools for package managers for popular Linux distributions:

[Debian/Ubuntu-based systems (APT)](#debian-and-ubuntu-apt) |
[Red Hat-based systems (DNF/YUM)](#fedora-rhel-centos-amazon-linux)

## Published apps

- [poof](https://github.com/pirafrank/poof)
- [vault-conductor](https://github.com/pirafrank/vault-conductor)

## Debian and Ubuntu (APT)

### Supported architectures

- `amd64` (`x86_64`)
- `arm64` (`aarch64`)
- `armhf` (`armv7`)
- `i386` (`i686`)
- `riscv64` (`riscv64gc`)

### Supported distributions

- Debian 9 (stretch) and newer
- Ubuntu 16.04 (xenial) and newer

### Install

```sh
curl -fsSL https://pkg.fpira.com/apt/gpg.pub \
  | sudo gpg --dearmor -o /usr/share/keyrings/pkg.fpira.com.gpg
echo "deb [signed-by=/usr/share/keyrings/pkg.fpira.com.gpg] https://pkg.fpira.com/apt stable main" \
  | sudo tee /etc/apt/sources.list.d/pkg.fpira.com.list
sudo apt update && sudo apt install <APPNAME>
```

### Uninstall

Uninstall the package by running:

```sh
sudo apt remove <APPNAME>
```

To also remove the repository:

```sh
sudo rm /etc/apt/sources.list.d/pkg.fpira.com.list /usr/share/keyrings/pkg.fpira.com.gpg
sudo apt update
```

## Fedora, RHEL, CentOS, Amazon Linux

### Supported architectures

- `x86_64`
- `aarch64`

### Supported distributions

- Fedora 24 and newer
- RHEL 8 / CentOS 8 / CentOS Stream 8
- RHEL 9 / CentOS Stream 9
- Amazon Linux 2
- Amazon Linux 2023

### Install

**RHEL 9 / CentOS Stream 9 / Fedora 36+:**

```sh
sudo rpm --import https://pkg.fpira.com/yum/gpg.pub
sudo tee /etc/yum.repos.d/pirafrank.repo << EOF
[pirafrank]
name=pirafrank
baseurl=https://pkg.fpira.com/yum/el9/$(uname -m)/
enabled=1
gpgcheck=1
gpgkey=https://pkg.fpira.com/yum/gpg.pub
EOF
sudo dnf install <APPNAME>
```

**RHEL 8 / CentOS 8 / CentOS Stream 8 / Fedora 24-35:**

```sh
sudo rpm --import https://pkg.fpira.com/yum/gpg.pub
sudo tee /etc/yum.repos.d/pirafrank.repo << EOF
[pirafrank]
name=pirafrank
baseurl=https://pkg.fpira.com/yum/el8/$(uname -m)/
enabled=1
gpgcheck=1
gpgkey=https://pkg.fpira.com/yum/gpg.pub
EOF
sudo dnf install <APPNAME>
```

**Amazon Linux 2023:**

```sh
sudo rpm --import https://pkg.fpira.com/yum/gpg.pub
sudo tee /etc/yum.repos.d/pirafrank.repo << EOF
[pirafrank]
name=pirafrank
baseurl=https://pkg.fpira.com/yum/amzn2023/$(uname -m)/
enabled=1
gpgcheck=1
gpgkey=https://pkg.fpira.com/yum/gpg.pub
EOF
sudo dnf install <APPNAME>
```

**Amazon Linux 2:**

```sh
sudo rpm --import https://pkg.fpira.com/yum/gpg.pub
sudo tee /etc/yum.repos.d/pirafrank.repo << EOF
[pirafrank]
name=pirafrank
baseurl=https://pkg.fpira.com/yum/amzn2/$(uname -m)/
enabled=1
gpgcheck=1
gpgkey=https://pkg.fpira.com/yum/gpg.pub
EOF
sudo yum install <APPNAME>
```

### Uninstall

```sh
# on newer systems:
sudo dnf remove <APPNAME>
# or on older distributions:
sudo yum remove <APPNAME>
```

To also remove the repository:

```sh
sudo rm /etc/yum.repos.d/pirafrank.repo
```
