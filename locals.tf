locals {
  var = jsondecode(file("${path.module}/variables.json"))
}
