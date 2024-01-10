/*
  Create an Elastic Beanstalk application
*/
resource "aws_elastic_beanstalk_application" "tftest-ebs-app" {
  name        = var.application_name
  description = "A sample application"
}
/*
  Create an Elastic Beanstalk environment
*/
resource "aws_elastic_beanstalk_environment" "tftest-ebs-env" {
  name                = var.environment_name
  application         = aws_elastic_beanstalk_application.tftest-ebs-app.name
  solution_stack_name = var.solution_stack_name
  /*
    Enable logs steams to CloudWatch
  */
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "StreamLogs"
    value     = true
    resource  = ""
  }
  /*
    Enable health logs steams to CloudWatch
  */
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
    name      = "HealthStreamingEnabled"
    value     = true
    resource  = ""
  }
  /*
    Health logs retention to CloudWatch
  */
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
    name      = "RetentionInDays"
    value     = "60"
    resource  = ""
  }
  /*
    Instance type for the EC2 instances
  */
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }
  /*
    EC2 IAM instance profile
  */
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  /*
    Root volume type
  */
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeType"
    value     = "gp2"
    resource  = ""
  }
  /*
    Root volume size
  */
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeSize"
    value     = var.root_volume_size
    resource  = ""
  }
  /*
    Environment type - LoadBalanced or SingleInstance
  */
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced"
    resource  = ""
  }
  /*
    Load balancer type - application or classic
  */
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
    resource  = ""
  }
  /*
    Depoyment policy - Rolling, Immutable, or RollingWithAdditionalBatch
  */
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "DeploymentPolicy"
    value     = "RollingWithAdditionalBatch"
    resource  = ""
  }
  /*
    Batch size type - Fixed or Percentage
  */
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSizeType"
    value     = "Fixed"
    resource  = ""
  }
  /*
    Batch size
  */
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSize"
    value     = 1
    resource  = ""
  }
  /*
    Rolling update enabled
  */
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = true
    resource  = ""
  }
  /*
    Rolling update batch size
  */
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MaxBatchSize"
    value     = var.max_batch_size
    resource  = ""
  }
  /*
    Min instances in service
  */
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MinInstancesInService"
    value     = var.min_instance_in_service
    resource  = ""
  }
  /*
    Rolling update type - Health or Immutable
  */
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = "Health"
    resource  = ""
  }
  /*
    Auto scaling trigger measure name - CPUUtilization, NetworkIn, NetworkOut, or Latency
  */
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "MeasureName"
    value     = "CPUUtilization"
    resource  = ""
  }
  /*
    Auto scaling trigger statistic - Average, Minimum, Maximum
  */
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Statistic"
    value     = "Maximum"
    resource  = ""
  }
  /*
    Auto scaling trigger period
  */
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Period"
    value     = 1
    resource  = ""
  }
  /*
    Auto scaling trigger lower breach scale increment
  */
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "BreachDuration"
    value     = 1
    resource  = ""
  }
  /*
    Auto scaling trigger unit - Percent or Seconds
  */
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Unit"
    value     = "Percent"
    resource  = ""
  }
  /*
    Auto scaling trigger upper threshold
  */
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "UpperThreshold"
    value     = 75
    resource  = ""
  }
  /*
    Auto scaling trigger lower threshold
  */
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "LowerThreshold"
    value     = 30
    resource  = ""
  }
  /*
    Auto scaling UpperBreachScaleIncrement - 1, 2, 3, 4, or 5
  */
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "UpperBreachScaleIncrement"
    value     = 1
    resource  = ""
  }
  /*
    Auto scaling minimum size
  */
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.min_auto_scaling_group_size
    resource  = ""
  }
  /*
    Auto scaling maximum size
  */
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max_auto_scaling_group_size
    resource  = ""
  }
  /*
    Load balancer HTTPS listener port
  */
  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "Protocol"
    value     = "HTTPS"
    resource  = ""
  }
  /*
    Load balancer HTTPS listener certificate
  */
  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "SSLCertificateArns"
    value     = aws_acm_certificate.tftest_cert.arn
    resource  = ""
  }
  /*
    Load balancer HTTPS listener security policy
  */
  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "SSLPolicy"
    value     = "ELBSecurityPolicy-TLS-1-1-2017-01"
    resource  = ""
  }
  /*
    Application tags
  */
  tags = {
    Name        = "Java App"
    Environment = "Development"
  }
}
/*
  Create an ACM certificate
*/
resource "aws_acm_certificate" "tftest_cert" {
  domain_name       = var.root_domain_name
  validation_method = "DNS"
  tags              = { Name = "tftest-acm-cert" }
}
/*
  Create a Route53 zone
*/
resource "aws_route53_zone" "tftest-route53-zone" {
  name = var.root_domain_name
}
/*
  Create a Route53 record to validate the ACM certificate
*/
resource "aws_route53_record" "tftest_cert_dns" {
  for_each = {
    for dvo in aws_acm_certificate.tftest_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 300
  type            = each.value.type
  zone_id         = aws_route53_zone.tftest-route53-zone.zone_id
}
/*
  Validate the ACM certificate
*/
resource "aws_acm_certificate_validation" "tftest_cert_validate" {
  certificate_arn         = aws_acm_certificate.tftest_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.tftest_cert_dns : record.fqdn]
}
/*
  Output the Beanstalk application name
*/
output "elastic_beanstalk_app_name" {
  value = aws_elastic_beanstalk_environment.tftest-ebs-env.name
}
/*
  Output the Beanstalk URL
*/
output "elastic_beanstalk_app_url" {
  value = aws_elastic_beanstalk_environment.tftest-ebs-env.endpoint_url
}


