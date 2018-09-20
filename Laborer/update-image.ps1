docker build . -t areconlabconreg.azurecr.io/econ-laborer
docker push areconlabconreg.azurecr.io/econ-laborer
terraform taint azurerm_container_group.main
terraform apply -auto-approve