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
    "wildcard-only" : {
      "single-actions" : var.wildcard_only_single_actions,
      "service-read" : var.wildcard_only_read_service,
      "service-write" : var.wildcard_only_write_service,
      "service-list" : var.wildcard_only_list_service,
      "service-tagging" : var.wildcard_only_tagging_service,
      "service-permissions-management" : var.wildcard_only_permissions_management_service,
    }
  }
  rendered_template = jsonencode(local.policy_sentry_template)
  decoded_template  = jsondecode(jsonencode(local.policy_sentry_template))
  minimize          = var.minimize ? "--minimize 0" : ""
}

resource "null_resource" "command" {
  # Just creating a unique string so that when the long unique string changes, the command will be run again.
  triggers = {
    policy_sentry_template = join(",", concat(
      var.read_access_level,
      var.write_access_level,
      var.list_access_level,
      var.permissions_management_access_level,
      var.tagging_access_level,
      var.wildcard_only_single_actions,
      var.wildcard_only_read_service,
      var.wildcard_only_write_service,
      var.wildcard_only_list_service,
      var.wildcard_only_tagging_service,
      var.wildcard_only_permissions_management_service,
      list(var.name),
      list(tostring(local.minimize))
    ))
  }

  provisioner "local-exec" {
    # If the json file exists from a previous run, delete it first.
    # command = "[ ! -e ${var.name}.json ] || rm ${var.name}.json && echo '${local.rendered_template}' | policy_sentry write-policy ${local.minimize} > ${var.name}.json"
    # Render the template as JSON and ingest via stdin
    command = "echo '${local.rendered_template}' | policy_sentry write-policy ${local.minimize} > ${var.name}.json"
  }

  provisioner "local-exec" {
    command = "[ ! -e ${var.name}.json ] || rm ${var.name}.json"
    when    = "destroy"
  }
}