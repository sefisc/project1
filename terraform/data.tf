data "http" "my_ip" {
  url = "https://checkip.amazonaws.com/"
}

locals {
  effective_my_ip_cidr = length(var.my_ip_cidr) > 0 ? var.my_ip_cidr : "${trimspace(data.http.my_ip.response_body)}/32"
}
