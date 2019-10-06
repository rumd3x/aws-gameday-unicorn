# aws-gameday-unicorn

Optimal solution for AWS Gameday Ep.6 (Unicorn Rentals) challenge.

## How to use

- Clone this project on your local machine.
- Install AWS-cli and Terraform on your machine.
- Configure your AWS Credentials (ACCESS_KEY and SECRET_KEY) on your `~/.aws/credentials` file.
- Run `terraform apply` to create the needed infrastructure.

- Login into your EC2 instance via SSH using `ssh -i key.pem [your.instance.ip.here] -l ubuntu`
- **IMPORTANT:** Configure a Swap partition on your EC2 Instance (Recommended 8GB or More).
- Inside your EC2 instance install docker and docker-compose `sudo apt update && sudo apt install docker.io docker-compose`
- Clone this project inside your EC2 instance `git clone https://github.com/rumd3x/aws-gameday-unicorn.git`
- Start the service by running `sudo docker-compose up -d --build --force-recreate --scale unicorn=8`
- Now take your CloudFront Domain Name and put it on your AWS GameDay Dashboard.

- When the time comes, edit the `Dockerfile` changing the line `ADD ./bins/server /server` to `ADD ./bins/server2 /server`.
- Stop the services with `sudo docker-compose stop`.
- Start the services again.
