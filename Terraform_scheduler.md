# Terraform Scheduler

**¿Qué es este repositorio?**

Es un módulo Terraform que implementa un **scheduler** (programador de encendido/apagado) para instancias **EC2 y RDS** en AWS.

**¿Qué hace?**

Este módulo usa **AWS Lambda + CloudWatch Events** para programar el encendido y apagado automático de:
- EC2 instances
- RDS databases

Repositorio: https://github.com/eanselmi/terraform-aws-ec2-rds-scheduler
