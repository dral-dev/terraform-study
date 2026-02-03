resource "null_resource" "deployment_prep" {

  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "echo Deployment started at ${timestamp()} > deployment.log"
  }

}
