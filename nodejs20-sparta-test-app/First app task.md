 First app steps

> ## For Sparta: see important rules about use

- When deleting a VM, delete everything associated with its name (e.g. if VM ends with week1-vm, everything week1-vm's name is associated with it), so vm, ip, network security group, network interface, disk
- BE SURE NOT TO DELETE RESOURCE GROUP
- go into three-dot menu, apply force delete, confirm deletion with typing

1. Create new git repo and sync it to Github
2. Create VM
3. Log into VM using existing SSH
4. Update and upgrade with -y flag
5. Install NGINX with -y flag
6. Check NGINX status
7. Install dependencies:
   1. NodeJS and maybe NPM
   2. Check if node is installed with *node -v*, same with npm
8. Download app folder from SP, extract it into home folder on local machine
9. In git on the local machine, use SCP or git clone to copy the app folder to the VM's home:
   1.  SCP method: s*cp -i ~/.ssh/tech501-farah-az-key -r nodejs20-sparta-test-app azureuser@20.254.65.158:~*
   2.  Git clone method: *git clone https://github.com/farahc123/tech501-sparta-app repo*
10. Once app is on the VM, cd into the app folder
11. Install NPM
12. start npm [should see a listening on port 3000 message]
13.  Get IP from Azure portal and add :3000 to the end, use this as URL to check app is working

## Creating a git repo and syncing it to Github

1. Create local folder
2. Navigate to it via Git Bash
3. <code> git init </code>
4. <code> git branch -m master main </code>
5. <code> git add . </code>
6. <code> git commit -m "initial commit </code>
7. Go into GitHub and create a new repo (ideally with the same name as the local repo folder); don't change any other settings
8. Copy the GitHub URL and run:
   1. <code> git remote add origin [URL] </code>
9. <code> git push -u origin main </code>

## Creating the second VM

> **Basics tab**: 
>   - **Name**: tech501-farah-first-deploy-app-vm
>   - **Security type**: Standard
>   - **OS**: Ubuntu server 22.04 lts x64 gen2
>   - **All other settings default**
>   - Use our existing SSH key
>   - Allow SSH and HTTP ports
> 
> - **Disk tab**:
>   - Standard SSD
> 
> - **Networking tab**:
>   -  Set to your  public subnet
  > - The following allows NSG to be reusable when we delete this VM:
  >      - Select **Advanced** network security group
  >     - Create new security group
  >      - Add inbound rule, set Service to HTTP 
  Add inbound rule, set **Destination port range** 3000, set protocol to **TCP** 
   >     - Rename network security group to **tech501-farah-sparta-app-allow-HTTP-SSH-3000**
>      - Nack in networking tab, enable** Delete public IP[...]**

