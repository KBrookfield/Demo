source "vsphere-supervisor" "vm" {
  keep_input_artifact = true
  supervisor_namespace = "namespace-1"
  
  class_name = "best-effort-small"
  image_name = "vmi-0c647bc6d5e7046b0"
  storage_class = "k8s-storage-policy"
  
  bootstrap_provider = "Sysprep"
  bootstrap_data_file = "sysprep-unattend-data.yml"

  ssh_username = "packer"
  ssh_password = "packer"
  
  publish_location_name = "cl-7b45e7808b051c0d3"
  publish_image_name = "windows-packer-image"
}

build {
  sources = ["source.vsphere-supervisor.vm"]

  provisioner "powershell" {
    inline = [
      "Set-Location $env:TEMP",
      "echo 'Hello from Packer!' | Out-File -FilePath ./hello-packer.txt",
    ]
  }
}
