

param serviceplanname string 
param serviceplanlocation string 
param sku string 
param webappname string 
param location string 



resource serviceplan 'Microsoft.Web/serverfarms@2022-09-01' = { 

  name: serviceplanname
  location: serviceplanlocation
  sku: {
      name: sku

  }

  kind: 'linux'

}


resource webapp 'Microsoft.Web/sites@2022-09-01' = {
  name: webappname
  location: location
  
  properties: {
    serverFarmId: serviceplan.id
    
  }
}
