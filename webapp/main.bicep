targetScope = 'subscription'
param RG string = 'webapp01dev'
param location string = 'uksouth'
param serviceplanname string = 'svcplan001'
param webappname string = 'webappnfe001'

resource webrg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: RG
  location: location
}


module webapp 'webapp.bicep' = {
  scope: webrg
  name: serviceplanname
  
  params: {
    serviceplanname: serviceplanname
    webappname: webappname
     location: location
  }
}


