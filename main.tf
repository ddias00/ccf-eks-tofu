resource "helm_release" "cloud_carbon_footprint" {
  name             = "cloud-carbon-footprint"
  chart            = "./charts/cloud-carbon-footprint"
  namespace        = "cloud-carbon"
  create_namespace = true
}

resource "kubernetes_manifest" "carbon_gateway" {
  depends_on = [ helm_release.cloud_carbon_footprint ]
  manifest = yamldecode(file("${path.module}/manifest/carbon-gateway.yaml")) 
}

resource "kubernetes_manifest" "carbon_virtual_service" {
  depends_on = [ helm_release.cloud_carbon_footprint ]
  manifest = yamldecode(file("${path.module}/manifest/carbon-virtual-service.yaml")) 
}