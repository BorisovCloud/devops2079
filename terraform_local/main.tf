# resource "local_file" "file" {
#   filename = each.value
#   content  = "Anton loves humus! - ${each.key} - ${each.value}"

#   for_each = var.filename_map
# }

variable "filename_map" {
    default = {
        "первый" = "pervyi.txt",
        "второй" = "vtoroi.txt",
        "третий" = "tretii.txt"
    }
}

# output "file_contents" {
#   value = local_file.file
#   sensitive = true
# }

resource "random_pet" "pet" {
  length    = 2
  separator = ""
}

# resource "local_file" "anton1" {
#   filename        = "anton.txt"
#   content         = "Anton loves humus!"

# }

# resource "local_file" "anton2" {
#   filename        = "anton.txt"
#   content         = "Anton loves humus!"
# }

# resource "random_pet" "pet" {
#   length    = 2
#   separator = ""
# }

# data "local_file" "petname" {
#   filename = "petname.txt"
# }