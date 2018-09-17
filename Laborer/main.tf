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
