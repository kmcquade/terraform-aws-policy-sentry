# Takes the relative path to the .json policy; remove the folder name and the extension. This will be our policy name
resource "aws_iam_policy" "policy" {
  count       = var.create_policy && fileexists("${var.name}.json") ? 1 : 0
  name        = replace("${var.name}.json", ".json", "")
  path        = "/"
  description = var.description
  policy      = data.template_file.dynamic_policy.rendered
}

data "template_file" "dynamic_policy" {
  template = var.create_policy && fileexists("${var.name}.json") ? file("${var.name}.json") : ""
}