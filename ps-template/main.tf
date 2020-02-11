# ---------------------------------------------------------------------------------------------------------------------
# Locals to create the policies
# ---------------------------------------------------------------------------------------------------------------------
locals {
  policy_sentry_template = {
    "mode" : "crud",
    "read" : var.read_access_level,
    "write" : var.write_access_level,
    "list" : var.list_access_level,
    "tagging" : var.tagging_access_level
    "permissions-management" : var.permissions_management_access_level,
    "wildcard" : var.wildcard_only_actions,
  }
  rendered_template = jsonencode(local.policy_sentry_template)
  decoded_template  = jsondecode(jsonencode(local.policy_sentry_template))
  minimize          = var.minimize ? "--minimize 0" : ""
}

resource "null_resource" "command" {
  triggers = {
    policy_sentry_template = join(",", concat(
      var.read_access_level,
      var.write_access_level,
      var.list_access_level,
      var.permissions_management_access_level,
      var.tagging_access_level,
      var.wildcard_only_actions,
      list(var.name),
      list(tostring(local.minimize))
    ))
  }

  provisioner "local-exec" {
    # Render the template as JSON and ingest via stdin
    command = "echo '${local.rendered_template}' | policy_sentry write-policy ${local.minimize} > ${var.name}.json"
  }
}