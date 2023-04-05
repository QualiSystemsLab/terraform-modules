variable "sleep" {
  default = "10s" 
}

resource "time_sleep" "wait_10_sec" {
  create_duration = var.sleep
}

#
output "sleep_out" {
  value = var.sleep 
}
