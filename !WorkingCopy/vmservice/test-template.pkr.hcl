source "vsphere-supervisor" "vm" {
  keep_input_artifact = true
  supervisor_namespace = "namespace-1"
  
  class_name = "best-effort-small"
  image_name = "vmi-8ebb602af523a7411"
  storage_class = "k8s-storage-policy"

  ssh_username = "packer"
  ssh_password = "packer"

  publish_location_name = "cl-119428472846574b9"
  publish_image_name = "packer-image"
}

build {
  sources = ["source.vsphere-supervisor.vm"]
  provisioner "shell" {
    inline = [
      "echo 'Hello from Packer!' > ./hello-packer.txt",
    ]
  }
}