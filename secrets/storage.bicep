param storagelocation string 
param storagename string 

resource storageacct 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storagename
  location: storagelocation
  sku: {

    name:'Standard_LRS'
  }
kind: 'StorageV2'
properties:{}
}

