#application_loadbalancer_target_group
resource "aws_lb_target_group" "appliction_target_group" {
    name                    = var.target_group_name
    target_type             = var.target_type_alb
    protocol                = var.protocol_alb
    port                    = var.port_alb
    vpc_id                  = var.vpc_id
    
    health_check {
        protocol            = var.protocol_alb
        path                = var.path_target
        port                = var.port_type_target_alb
        healthy_threshold   = var.healthy_threshold
        unhealthy_threshold = var.unhealthy_threshold
        interval            = var.interval    
    }   
}

#attach a instance to the target_group and register
resource "aws_lb_target_group_attachment" "appliction_target_group_attachment" {
    port                    = var.targt_group_attachment_portnumber
    target_id               = var.target_id_for_instance
    target_group_arn        = aws_lb_target_group.appliction_target_group.arn            
}

###########################################################################################

#application load_balancer creation
resource "aws_lb" "application_lb" {
    name                    = var.alb_name
    internal                = false
    ip_address_type         = var.ip_address_type
    //availability_zone       = var.availability_zone_for_alb
    subnets                 = var.subnet_for_alb
    load_balancer_type      = var.load_balancer_type
    security_groups         = [var.security_group_for_alb]
}

#application load_balancer listener creation 
resource "aws_lb_listener" "application_lb_listener" {
    load_balancer_arn       = aws_lb.application_lb.arn
    protocol                = var.protocol_alb
    port                    = var.alb_listener_portnumber
    default_action {
      target_group_arn      = aws_lb_target_group.appliction_target_group.arn
      type                  = var.listener_type
    }        
}








