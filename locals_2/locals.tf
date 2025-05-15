locals {
  sufix = "${var.tags.project}-${var.tags.Environment}-${var.tags.region}" #recurso-cerberus-prod-region
}

resource "random_string" "sufijo-s3" {
  length = 4
  special = false
  upper = false
}

locals {
  s3-sufix = "${local.sufix}-${random_string.sufijo-s3.id}"
}
