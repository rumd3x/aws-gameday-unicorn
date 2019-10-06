provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

resource "aws_security_group" "unicorn-sg" {
  name = "unicorn-sg"

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]

    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]

    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]

    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCE2B/Ajo0MB75CtKS14fVAsPN+qTF10v7BKNNwYAdCHT8N+diqEUQltEbBOkdiRaD8+ro4fZQuxYhnJHJKjXfVxwdBU9/yPN/FszVNCSxPgIgBEJ0AocZ3cwEAruTWH4SHhVgmpVhPoBOl+FvR9O2k79SFKO7msOPHt58HghZmRhwBhv65ixIvK9RhbzZPmdPMjDRpvDotvD0ffUNd5GkhWi/JOef2zBTZRKjwsUUYMD3Z76BYLPQFbpKUv2O72BLHM0xcoZG3LubrSOUbKh+G/QosZDy4PBRIC3Ld/WyZgScjGI4/ccVjA5dV+Oq08+3b8Nj1M6lXF2yhqxgRWV1/"
}

resource "aws_instance" "app-instance" {
  ami           = "ami-07d0cf3af28718ef8"
  instance_type = "t2.micro"

  security_groups = ["${aws_security_group.unicorn-sg.name}"]
  key_name        = "${aws_key_pair.ssh-key.key_name}"

  tags = {
    Name = "Unicorn-WS-0"
  }
}

resource "aws_cloudfront_distribution" "app-cache" {
  enabled = true

  origin {
    domain_name = "${aws_instance.app-instance.public_dns}"
    origin_id   = "${aws_instance.app-instance.id}"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods        = ["HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH"]
    cached_methods         = ["HEAD", "GET", "OPTIONS"]
    viewer_protocol_policy = "redirect-to-https"

    target_origin_id = "${aws_instance.app-instance.id}"

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }
  }

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 400
  }

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 403
  }

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 404
  }

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 500
  }

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 501
  }

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 502
  }

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 503
  }

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 504
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

}
