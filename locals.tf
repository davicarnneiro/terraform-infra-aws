locals {
  webpage    = base64encode(templatefile("${path.module}/files/template/index.html", { env = var.env }))
  nginx_conf = filebase64("${path.module}/files/template/hello.conf")
}