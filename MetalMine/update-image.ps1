docker build . -t areconmetminconreg.azurecr.io/econ-metalmine
docker push areconmetminconreg.azurecr.io/econ-metalmine
terraform taint azurerm_container_group.main
terraform apply -auto-approve