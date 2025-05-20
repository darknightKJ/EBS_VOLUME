# Create an EBS volume
resource "aws_ebs_volume" "goldberg_ebs_volume" {
  availability_zone = "ap-southeast-1a"
  size              = 1
  type              = "gp3"
  iops              = 3000
  throughput        = 125

  tags = {
    Name = "Goldberg-ebs-volume"
  }
}

# Find the EC2 instance by name
#data "aws_instance" "kris_second_ec2" {
#  filter {
#    name   = "tag:Name"
#    values = ["kris_second_ec2"]
#  }
#}

# Attach the EBS volume to the EC2 instance
resource "aws_volume_attachment" "attach_goldberg_ebs_volume" {
  device_name = "/dev/sdb"  
  volume_id   = aws_ebs_volume.goldberg_ebs_volume.id
  instance_id = "i-0721102a181f2e53a"
}
