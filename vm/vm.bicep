



@description('Size of the virtual machine.')
param vmSize string = 'Standard_D2s_v5'

@description('Location for all resources.')
param location string 


@description('username for server')
@minLength(3)
param svrusername string 

@description('password for server, min 8 chars')
@secure()
@minLength(8)
param svrpassword string


resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' existing = {
  name: 'vnet2'
  scope: resourceGroup('networkingnfe') 

}




resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' existing = { 
  name: 'vmsubnet'
   parent: vnet
   
}



resource vm 'Microsoft.Compute/virtualMachines@2023-07-01' = {
  name: 'vmdeployment'
  location: location
  
 properties: {

 
 osProfile: {
   adminUsername: svrusername
    adminPassword: svrpassword
     computerName: 'vmnfe01'
 }

 hardwareProfile: {
   vmSize:  'Standard_B1s'
 }
  networkProfile: {
     networkInterfaces: [
       {
         id: networkinterface.id
       }
     ]
  }
   storageProfile: {
     imageReference: {
       publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
       version: 'latest'
        sku: '2019-Datacenter'
     }

 
     

 }

 
    
   }


 }   


 resource publicipaddress 'Microsoft.Network/publicIPAddresses@2023-05-01' = {
  name: 'publicIP'
   location: location
    
   properties: {
     publicIPAllocationMethod: 'Dynamic'
   }      
}

resource networkinterface 'Microsoft.Network/networkInterfaces@2023-05-01' = {
  name: 'vmnetwork'
   location: location
  
   properties: {
     
     ipConfigurations: [
          {
             name: 'ifconfig'
              properties: {
                 subnet: {
                   id: subnet.id
                 }
                  privateIPAllocationMethod: 'Dynamic'
                    

 publicIPAddress: { 
    id: publicipaddress.id
 }


                    
              }
          }
          
     ]

   }

}



module lockRG 'lockrg.bicep' = {
  name: 'lockrg'
   scope: resourceGroup('servernfe2016')
}
