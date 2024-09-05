terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.60.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_db_instance" "db" {
  allocated_storage    = 10
  db_name              = "db-${var.app_name}-${var.app_environment}"
  engine               = "postgres"
  engine_version       = "14.10"
  instance_class       = "db.t3.micro"
  username             = "postgres"
  password             = "${var.db_password}"
  parameter_group_name = aws_db_parameter_group.pg.name
  skip_final_snapshot  = true
}

resource "aws_db_parameter_group" "pg" {
  name   = "rds-pg-${var.app_name}-${var.app_environment}"
  family = "postgres13/4"

  parameter {
    name  = "shared_preload_libraries"
    value = "pg_stat_statements,pg_cron"
  }

  parameter {
    name  = "cron.database_name"
    value = "db-${var.app_name}-${var.app_environment}"
  }
}