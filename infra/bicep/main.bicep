// Main Bicep file for Azure infrastructure
param storageAccountName string = 'cloudresumestorage${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location
param skuName string = 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

output storageAccountNameOutput string = storageAccount.name
output storageAccountEndpoint string = storageAccount.properties.primaryEndpoints.web
