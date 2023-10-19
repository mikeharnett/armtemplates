param subnetarr array = [
  { 
    name: subnet1
    subnetaddress: '10.0.5.0/24'
  }
  {
    name: subnet2
    subnetaddress: '10.0.6.0/24'
  }
]


var subnetproperty = [for subnet in subnetarr: {
  name: subnet.name
  properties: {
    addressprefix: subnet.subnetaddress
  }

}] 


resource virtualnetwork 'Microsoft.Network/virtualNetworks@2023-05-01' existing = {
    name: 'vnet2'
}


resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  name: subnetproperty.

}
