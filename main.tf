module "global" {
  source = "global"
}

module "prod" {
  source             = "environments/prod"
  environment_prefix = "prod"
}

module "stage" {
  source             = "environments/stage"
  environment_prefix = "stage"
}
