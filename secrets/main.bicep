targetScope = 'subscription'


param RGname string = 'mikenferg001'
param RGLocation string = 'uksouth'
param storagelocation string = RGLocation
param storagename string = 'strnfe0991'
param svcplanname string = 'svcplan001'
param webappname string = 'webappnfea001'
param sku string = 'F1'







resource newRG 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name:RGname
  location: RGLocation
  
}





module storageacct 'storage.bicep' = {

  name: 'storageModule'
  scope:newRG
  params: {
      storagelocation: storagelocation
      storagename: storagename

  }

}


var storageacct = storageacct.outputs


module webserviceplan 'webapp.bicep' = {
  name: 'webmodule'
  scope: newRG
  params: {
    serviceplanname: svcplanname
    location: RGLocation
    serviceplanlocation: RGLocation
    webappname: webappname
    sku: sku

  }

}








