output "file_name" {
  value       = "${var.name}.json"
  description = "The path of the file."
}

output "policy_sentry_template_contents" {
  description = "The contents of the Policy Sentry template"
  value       = local.rendered_template
}

# the policy needs to be base64 decoded from the external data source
output "policy_json" {
  description = "The contents of the policy"
  value       = base64decode(data.external.policy.result.base64)
}
