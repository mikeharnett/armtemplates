
param serviceplanname string
param webappname string
param location string 
param appinsightname string = 'appinsight'



resource appserviceplan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: serviceplanname
  location: location
   kind: 'linux'
    sku: {
        name: 'F1'
         
    }
  properties: {
       
  }
}

resource webapp 'Microsoft.Web/sites@2022-09-01' = {
  name: webappname 
  location: location
  kind: 'linux'
    properties: {
     httpsOnly: true
      serverFarmId: appserviceplan.id 
    }
}


resource appinsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appinsightname
  location: location
  kind: 'web'
   properties: {
    Application_Type:  'web'
     
   }
}


resource webappnfe001 'Microsoft.Web/sites/config@2022-09-01' = {
  name: 'web'
  parent: webapp
   properties: {
    appSettings:  [
      {
        name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: appinsights.properties.InstrumentationKey
      }
      {
        name: 'ApplicationInsightsAgent_EXTENSION_VERSION'
        value: '~2'
      }
      
    ]
    
  
  }
}
