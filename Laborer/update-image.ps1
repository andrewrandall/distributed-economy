docker build . -t areconlabconreg.azurecr.io/econ-laborer-hello
docker push areconlabconreg.azurecr.io/econ-laborer-hello
terraform taint azurerm_container_group.main
terraform apply -auto-approve