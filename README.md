Infrastrucutre as Code [AWS] - Pre requisite

1. Create the public private key from the aws console
    * Convert the aws key from pem to ppk using the putty gen.
    * Creating the aws Ubuntu instance using the same key pair
    * Configuring the AWS  CLI tool in the instances using the below command 

sudo apt  install awscli
aws –version 

2. Installation of Git in Ubuntu machine 
    > Use the following command to install the git   
    > apt-get install git-core

3. Installing the terraform on the Ubuntu machine 
    > Below are the step used to install the terraform on the Ubuntu machine  
    
    > sudo apt-get install unzip  
    > wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip  
    > unzip terraform_0.11.13_linux_amd64.zip  
    > sudo mv terraform /usr/local/bin/  
    > terraform --version  


You should get the output like:
 
* Now create the folder for the project 
* Copy the terraform script in it 
* You can get the public key pair for the following command 
~/.ssh/authorized_keys

Copy public key and private key in the folder
