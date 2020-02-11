<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| list\_access\_level | Provide a list of Amazon Resource Names (ARNs) that your role needs LIST access to. | `list` | <pre>[<br>  ""<br>]</pre> | no |
| minimize | If set to true, it will minimize the size of the IAM Policy file. Defaults to false. | `bool` | `false` | no |
| name | The name of the rendered policy file (no file extension). | `string` | n/a | yes |
| permissions\_management\_access\_level | Provide a list of Amazon Resource Names (ARNs) that your role needs PERMISSIONS MANAGEMENT access to. | `list` | <pre>[<br>  ""<br>]</pre> | no |
| read\_access\_level | Provide a list of Amazon Resource Names (ARNs) that your role needs READ access to. | `list` | <pre>[<br>  ""<br>]</pre> | no |
| tagging\_access\_level | Provide a list of Amazon Resource Names (ARNs) that your role needs TAGGING access to. | `list` | <pre>[<br>  ""<br>]</pre> | no |
| wildcard\_only\_actions | Only actions that do not support resource constraints | `list` | <pre>[<br>  ""<br>]</pre> | no |
| write\_access\_level | Provide a list of Amazon Resource Names (ARNs) that your role needs WRITE access to. | `list` | <pre>[<br>  ""<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| file\_name | The path of the file. |
| policy\_sentry\_template\_contents | The contents of the Policy Sentry template |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
