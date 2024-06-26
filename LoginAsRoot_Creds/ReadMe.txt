-------------
-------------

ansible_host: your_server_ip
ansible_user: your_username
ansible_ssh_pass: your_password
ansible_become_pass: your_root_password


-------------
-------------

# ansible-vault encrypt LoginAsRoot_Creds.yaml


-------------
-------------

redhat2 ansible_host={{ ansible_host }} ansible_user={{ ansible_user }} ansible_ssh_pass={{ ansible_ssh_pass }} ansible_become_pass={{ ansible_become_pass }}

-------------
-------------

---
- name: Log in as root with password
  hosts: all
  become: yes
  become_user: root

  vars:
    new_user: "elma"

  vars_files:
   - LoginAsRoot_Creds.yaml

  tasks:
    - name: Ensure we are logged in as root
      command: whoami
      register: login_check

    - name: Display login user
      debug:
        msg: "Logged in as {{ login_check.stdout }}"

    - name: "Add the user {{ new_user }} with a specific uid"
      ansible.builtin.user:
        name: "{{ new_user }}"
        comment: "{{ new_user }}"
        uid: 1040

