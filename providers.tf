terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = "= 1.0.79"
    }
  }
}

provider "intersight" {
  endpoint = "https://intersight.com"
}
