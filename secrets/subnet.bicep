targetScope = 'resourceGroup'

//param subnet string
param subnet array
param vnet string

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' existing = {

  name: vnet
}
 
resource subnets 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
    name: subnet.name
    parent: virtualNetwork

    properties: {
        addressPrefix: subnet.subnetaddress

    }


}


