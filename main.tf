data "http" "zen" {
  url = var.github_zen_api
}

data "http" "ipify" {
  url = var.ipify_api
}

data "http" "icanhazdadjoke" {
  url = var.icanhazdadjoke_api

  request_headers = {
    Accept = "application/json"
  }
}

resource "local_file" "zen_file" {
  content = data.http.zen.response_body
  filename = var.zen_file
}

resource "local_file" "ipify_file" {
  content = data.http.ipify.response_body
  filename = var.ipify_file
}

resource "local_file" "icanhazdadjoke" {
  content = jsondecode(data.http.icanhazdadjoke.response_body).joke
  filename = var.icanhazdadjoke_file
}

resource "local_file" "summary" {
  filename = var.summary_file
  content = <<EOT
        API: ${data.http.zen.id}  Output: ${data.http.zen.response_body} Status Code: ${data.http.zen.status_code},
        API: ${data.http.ipify.id}  Output: ${data.http.ipify.response_body} Status Code: ${data.http.ipify.status_code},
        API: ${data.http.icanhazdadjoke.id}  Output: ${jsondecode(data.http.icanhazdadjoke.response_body).joke} Status Code: ${data.http.icanhazdadjoke.status_code},
  EOT
}

# output "zen_output" {
#   value = data.http.zen.response_body
# }

# output "ipify_output" {
#   value = data.http.ipify.request_body
# }

# output "icanhazdadjoke_ic" {
#   value = jsondecode(data.http.icanhazdadjoke.response_body).joke
# }