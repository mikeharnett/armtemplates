

param loc string
param name string
param adminuser bool

@description('Provide sku name')
@allowed([
  'basic'
  'standard'
])
param skuname string






resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  
  name: name
  location: loc
  sku: {
    name: skuname
  }
  properties: {
    adminUserEnabled: adminuser
  }
}
