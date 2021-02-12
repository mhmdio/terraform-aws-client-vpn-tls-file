# Client VPN Module

AWS Client VPN is a managed client-based VPN service that enables you to securely access your AWS resources and resources in your on-premises network. With Client VPN, you can access your resources from any location using an OpenVPN-based VPN client.

This module will help automate the generation of openVPN compatible configuration file.

## Requirements

- aws_ec2_client_vpn_endpoint.this.dns_name
- tls_private_key.ca.private_key_pem
- tls_self_signed_cert.ca.cert_pem

## Providers

| Name     | Version |
| -------- | ------- |
| local    | n/a     |
| template | n/a     |
| tls      | n/a     |

## Inputs

| Name             | Description | Type     | Default | Required |
| ---------------- | ----------- | -------- | ------- | :------: |
| ca\_cert         | n/a         | `any`    | n/a     |   yes    |
| ca\_private\_key | n/a         | `any`    | n/a     |   yes    |
| dns\_name        | n/a         | `string` | n/a     |   yes    |
| domain\_name     | n/a         | `string` | n/a     |   yes    |
| name             | n/a         | `string` | n/a     |   yes    |
| user\_name       | n/a         | `string` | n/a     |   yes    |

## Outputs

No output.
