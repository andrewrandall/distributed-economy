resource "azurerm_resource_group" "main" {
	name		= "ar-econ-metmin-resgroup"
	location	= "centralus"
}

resource "azurerm_storage_account" "main" {
	name				= "areconmetminstoracct"
	resource_group_name		= "${azurerm_resource_group.main.name}"
	location			= "centralus"
	account_tier			= "Standard"
	account_replication_type	= "LRS"
}

resource "azurerm_container_registry" "main" {
	name = "areconmetminconreg"
	resource_group_name = "${azurerm_resource_group.main.name}"
	location = "${azurerm_resource_group.main.location}"
	storage_account_id = "${azurerm_storage_account.main.id}"
	admin_enabled = true
}

resource "azurerm_container_group" "main" {
	name = "ar-econ-metmin-container-group"
	location = "${azurerm_resource_group.main.location}"
	resource_group_name = "${azurerm_resource_group.main.name}"
	os_type = "linux"
	ip_address_type = "public"

	container {
		name = "ar-econ-metmin-container"
		image = "areconmetminconreg.azurecr.io/econ-metalmine"
		cpu = "0.1"
		memory = ".5"
		port = "80"
	}

	image_registry_credential {
		server = "areconmetminconreg.azurecr.io"
		username = "${azurerm_container_registry.main.admin_username}"
		password = "${azurerm_container_registry.main.admin_password}"
	}
}