

resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' existing = {
  name: 'vnet2'
  
}


resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
   parent:vnet 
   name: 'sqlsubnet'
  
   properties: {
     addressPrefix: '10.1.8.0/24'
      delegations: [
        {
           name: 'managedinstancedelegation'
           properties: {
            serviceName: 'Microsoft.Sql/managedinstances'  

           }

        }
      ]
      
   }
}
