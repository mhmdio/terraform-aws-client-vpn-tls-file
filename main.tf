resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "tls_cert_request" "this" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.this.private_key_pem

  subject {
    common_name  = "${var.user_name}.vpn.${var.domain_name}"
    organization = var.name
  }
}

resource "tls_locally_signed_cert" "this" {
  cert_request_pem   = tls_cert_request.this.cert_request_pem
  ca_key_algorithm   = "RSA"
  ca_private_key_pem = var.ca_private_key
  ca_cert_pem        = var.ca_cert

  validity_period_hours = 87600

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "client_auth",
  ]
}

data "template_file" "this" {
  template = file("${path.module}/0vpn.tpl")
  vars = {
    vpn_dns_name = var.dns_name
    ca           = var.ca_cert
    cert         = tls_locally_signed_cert.this.cert_pem
    key          = tls_private_key.this.private_key_pem
  }

  depends_on = [
    tls_locally_signed_cert.this,
    tls_private_key.this
  ]
}

resource "local_file" "this" {
  content  = data.template_file.this.rendered
  filename = "../${path.root}/${var.name}-${var.user_name}.ovpn"
}
