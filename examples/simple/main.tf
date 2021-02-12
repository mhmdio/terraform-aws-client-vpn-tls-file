module "mohammed" {
  source = "../../"

  user_name      = "mohammed"
  name           = var.name
  domain_name    = var.domain_name
  dns_name       = aws_ec2_client_vpn_endpoint.this.dns_name
  ca_private_key = tls_private_key.ca.private_key_pem
  ca_cert        = tls_self_signed_cert.ca.cert_pem
}

# ... other resources
