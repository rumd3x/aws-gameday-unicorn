# aws-gameday-unicorn

Optimal solution for AWS Gameday Ep.6 (Unicorn Rentals) challenge.

# NOTICE - PLEASE READ

I was approached by one of the developers on the actual AWS Gameday team about this repository, where he kindly asked me to take it down. There have been reports of people using my solution to just win the game.

Here's my response to him:

> I'm very sorry to hear that.
> 
> It was never my intention for people with lacking sportmanship to use my repository as a means to cheat on a learning experience.
> When I participated on this AWS GameDay a couple years ago it was a lot of fun, but when I came home I wanted to know how I could have performed even better.
>
> That's how this little project came to be, it was supposed to be a way for the participants to come back home and compare what they did to what I did, and maybe even improve upon it and have a couple discussions and whatnot.
> 
> Anyhow, I'll be taking the repository down shortly

Initially I was going to comply and take this project down, but once something it's in the internet it's never coming off it. As the time I'm writing this there's already 10 Forks of this project, and tools like waybackmachine exists, so it wouldn't solve anything, so instead i'm writing this appeal.

AWS Gameday is a LEARNING EXPERIENCE GAME. Please, **DO NOT USE THIS PROJECT TO WIN THE GAME**

**DO NOT USE THIS PROJECT TO CHEAT**

**DO NOT USE THIS PROJECT TO CHEAT**

**DO NOT USE THIS PROJECT TO CHEAT**

Thank you.

---

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
