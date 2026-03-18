data "intersight_iam_end_point_role" "admin_role" {
  name      = "admin"
  role_type = "endpoint-admin"
  type      = "IMC"
}

resource "intersight_iam_end_point_user_policy" "local_user_policy" {
  name        = "ue-local-user-imc"
  description = "Local user policy for eCMC"

  password_properties {
    enforce_strong_password  = false
    enable_password_expiry   = false
    force_send_password      = true
    password_expiry_duration = 1
    password_history         = 0
    notification_period      = 0
    grace_period             = 0
  }

  organization {
    moid        = var.org_moid
    object_type = "organization.Organization"
  }

  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }
}

resource "intersight_iam_end_point_user" "admin_user" {
  name = "admin"

  organization {
    moid        = var.org_moid
    object_type = "organization.Organization"
  }
}

resource "intersight_iam_end_point_user_role" "admin_user_role" {
  enabled  = true
  password = var.local_user_password

  end_point_role {
    moid        = data.intersight_iam_end_point_role.admin_role.results[0].moid
    object_type = "iam.EndPointRole"
  }

  end_point_user {
    moid        = intersight_iam_end_point_user.admin_user.moid
    object_type = "iam.EndPointUser"
  }

  end_point_user_policy {
    moid        = intersight_iam_end_point_user_policy.local_user_policy.moid
    object_type = "iam.EndPointUserPolicy"
  }
}
