# bacularis

Install and configure [bacularis](https://github.com/bacularis) - a web
interface to configure, manage and monitor the Bacula backup environment.

|GitHub|Downloads|Version|
|------|---------|-------|
|[![github](https://github.com/balling-dev/ansible-role-bacularis/workflows/Continuous%20Integration/badge.svg)](https://github.com/balling-dev/ansible-role-bacularis/actions)|[![downloads](https://img.shields.io/ansible/role/d/balling-dev/bacularis)](https://galaxy.ansible.com/ui/standalone/roles/balling-dev/bacularis)|[![Version](https://img.shields.io/github/release/balling-dev/ansible-role-bacularis.svg)](https://github.com/balling-dev/ansible-role-bacularis/releases/)|

## Example Playbook

This example is taken from
[`molecule/default/converge.yml`](
https://github.com/balling-dev/ansible-role-bacularis/blob/main/molecule/default/converge.yml)
and is tested on each push, pull request and release.

```yaml
---
- name: "Converge"
  hosts: "all"
  become: true
  gather_facts: true

  roles:
    - role: "balling-dev.bacularis"
```

## Role Variables

The default values for the variables are set in
[`defaults/main.yml`](https://github.com/balling-dev/ansible-role-bacularis/blob/main/defaults/main.yml):

```yaml
---
# Defaults file for bacularis

# Version of bacularis to install. Use "latest" to install latest version.
bacularis_version: "latest"
```
