# aws-gameday-unicorn

Optimal solution for AWS Gameday Ep.6 (Unicorn Rentals) challenge

## How to use

- Clone this project on your machine.
- Install Docker, AWSCLI and Terraform on your machine.
- Configure your AWS Credentials (ACCESS_KEY and SECRET_KEY) on your `~/.aws/credentials` file.
- Run `terraform apply` to create the needed infrastructure.
- Login into your EC2 instance via SSH using `ssh -i key.pem [your.instance.ip.here] -l ubuntu`
- Inside your EC2 instance install docker and docker-compose `sudo apt update && sudo apt install docker.io docker-compose`
- Clone this project inside your EC2 instance
- Edit the `docker-compose.yml` file replacing the `unicorn.localhost` part with your CloudFront Domain Name.
- Start the services by running `sudo docker-compose up -d --scale unicorn=8`
