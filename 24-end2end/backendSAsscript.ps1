
# Variables
$RESOURCE_GROUP_NAME="rgtfstate10199"
$STAGE_SA_ACCOUNT="sastagetfstate10199"
$DEV_SA_ACCOUNT="sadevtfstate10199"
$CONTAINER_NAME="conttfstate10199"
$LOCATION="Central US"

#RG

az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

#Verify

az group show -n $RESOURCE_GROUP_NAME -o table


#2 SAs

az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STAGE_SA_ACCOUNT --sku Standard_LRS --encryption-services blob --location $LOCATION


az storage account create --resource-group $RESOURCE_GROUP_NAME --name $DEV_SA_ACCOUNT --sku Standard_LRS --encryption-services blob --location $LOCATION


#Verify

az storage account list -g $RESOURCE_GROUP_NAME -o table



#Create containers and verify

az storage container create --name $CONTAINER_NAME --account-name $STAGE_SA_ACCOUNT --auth-mode login

az storage container create --name $CONTAINER_NAME --account-name $DEV_SA_ACCOUNT --auth-mode login


az storage container list --account-name $DEV_SA_ACCOUNT --auth-mode login -o table


