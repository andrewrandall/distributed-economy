resource "azurerm_resource_group" "main" {
	name		= "ar-econ-lab-resgroup"
	location	= "centralus"
}

resource "azurerm_storage_account" "main" {
	name				= "areconlabstoracct"
	resource_group_name		= "${azurerm_resource_group.main.name}"
	location			= "centralus"
	account_tier			= "Standard"
	account_replication_type	= "LRS"
}

resource "azurerm_storage_queue" "queue" {
	name = "ar-econ-lab-queue"
	storage_account_name = "${azurerm_storage_account.main.name}"
	resource_group_name = "${azurerm_resource_group.main.name}"
}

resource "azurerm_container_registry" "main" {
	name = "areconlabconreg"
	resource_group_name = "${azurerm_resource_group.main.name}"
	location = "${azurerm_resource_group.main.location}"
	storage_account_id = "${azurerm_storage_account.main.id}"
	admin_enabled = true
}

resource "azurerm_storage_share" "main" {
	name = "ar-econ-lab-logs-share"
	resource_group_name = "${azurerm_resource_group.main.name}"
	storage_account_name = "${azurerm_storage_account.main.name}"
	quota = 1
}

resource "azurerm_container_group" "main" {
	name = "ar-econ-lab-container-group"
	location = "${azurerm_resource_group.main.location}"
	resource_group_name = "${azurerm_resource_group.main.name}"
	os_type = "linux"
	ip_address_type = "public"

	container {
		name = "ar-econ-lab-container"
		image = "areconlabconreg.azurecr.io/econ-laborer-hello"
		cpu = "0.5"
		memory = "1.5"
		port = "80"

		volume {
			name = "logs"
			mount_path = "/logs"
			read_only = false
			share_name = "${azurerm_storage_share.main.name}"
			storage_account_name = "${azurerm_storage_account.main.name}"
			storage_account_key = "${azurerm_storage_account.main.primary_access_key}"
		}
	}

	image_registry_credential {
		server = "areconlabconreg.azurecr.io"
		username = "areconlabconreg"
		password = "T3Yl26YlfZi81izxAz7vJwuCWFb=1ugo"
	}
}