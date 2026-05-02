resource "local_file" "anton" {
  filename = "anton.txt"
  content  = "Anton loves humus!"

  # depends_on = [ local_file.anton3 ]
}

resource "local_file" "anton2" {
  filename = "anton2.txt"
  content  = "Anton loves humus!"
  file_permission = "0640"

  depends_on = [ local_file.anton ]
}

resource "local_file" "anton3" {
  filename = "anton3.txt"
  content  = "Anton loves humus!"
  file_permission = "0640"

  depends_on = [ local_file.anton2 ]
}

resource "random_pet" "pet" {
  length    = 2
  separator = ""
}
