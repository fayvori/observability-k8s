resource "yandex_iam_service_account" "kubernetes-sa" {
  name        = "kubernetes-service-account"
  description = "A separate sa for managing kubernetes clusters"
}

# IAM binding role
resource "yandex_resourcemanager_folder_iam_binding" "kubernetes-sa-binding" {
  folder_id = var.folder-id
  role      = "admin"

  members = [
    "serviceAccount:${yandex_iam_service_account.kubernetes-sa.id}"
  ]
}
