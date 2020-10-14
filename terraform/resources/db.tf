# module "new-rds" {
#   source                 = "/Users/elchoco/aws/terraform_infrastructure_as_code/modules/storage/rds"
#   allocated-storage      = "${var.storage}" # optionals since we using snapshot identifier
#   engine                 = "${var.engine}"
#   storage-type           = "${var.storage-type}"
#   db-identifier          = "encs691k-prod"
#   db-name                = "${var.db-name}"
#   username               = "${var.username}"
#   password               = "${var.password}" # need to have a secure way of keeping this
#   engine-version         = "${var.engine-version}"
#   instance-class         = "${var.instance-class}"
#   rds-name               = "${var.rds-name}-prod-private"
#   db-subnet-group        = "${aws_db_subnet_group.rds-subnet-group-private.id}"
#   publicly-accessible    = "${var.publicly-accessible}"
#   vpc-security-group-ids = "${split(",", data.terraform_remote_state.security.outputs.database-security-group)}"
#   availability-zone      = "us-east-1a"
#   db-port                = "${var.db-port}"
#   maintenance-windows    = "Sun:00:00-Sun:03:00"
#   final-snapshot         = "${var.final-snapshot}-${formatdate("MMMM-DD-YYYY-hh-mm-ss", timestamp())}"
#   skip-final             = "${var.skip-final-snapshot}"
#   tags = {
#     Name          = "encs691k-prod"
#     Template      = "encs_691k"
#     Environment   = "prod"
#     Application   = "auction_system"
#     Purpose       = "MYSQL database set up for the auction application"
#     Creation_Date = "September_25_2020"
#   }
# }

# resource "aws_db_subnet_group" "rds-subnet-group-private" {
#   name       = "encs_691k-${var.subnet-group-name}-prod"
#   subnet_ids = ["${element(element(data.terraform_remote_state.vpc.outputs.pri-subnet-id-a, 1), 1)}", "${element(element(data.terraform_remote_state.vpc.outputs.pri-subnet-id-b, 1), 1)}"]

#   tags = {
#     Name          = "Auction_System_SubnetGroups"
#     Template      = "encs_691k"
#     Environment   = "prod"
#     Application   = "auction_system"
#     Purpose       = "setting up subnet groups for the MYSQL database"
#     Creation_Date = "September_25_2020"
#   }
# }

# resource "aws_route53_record" "db_record" {
#   zone_id = "Z02263174XWJY3JJ7BCP"
#   name    = "db"
#   type    = "CNAME"
#   ttl     = "300"
#   records = ["${module.new-rds.rds-address}"]
# }