param kvname string = 'nfekeyvault099'
param location string = 'UKSouth'

@maxLength(20)
param username string = 'svradmin'




resource keyvault 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
  name: kvname
   scope: resourceGroup('keyvaults')
}


module vm 'vm.bicep' = {
  name: 'deployRG' 
   
   
  params: {
    svrpassword: keyvault.getSecret('vmpassword')
    svrusername: username
    location: location
    
  }
}
