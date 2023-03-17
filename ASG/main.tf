module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = "my-asg"

  min_size                  = 2
  max_size                  = 3
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier = module.vpc.public_subnets

# Launch template
  launch_template_name        = "example-asg"
  launch_template_description = "Launch template example"
  update_default_version      = true

  key_name = "devops_lab"
  security_groups = [aws_security_group.MYSG.id]

  image_id          = "ami-096eb0f41d0cfaf5a"
  instance_type     = "t2.micro"
  #ebs_optimized     = true
  #enable_monitoring = true

}








 


