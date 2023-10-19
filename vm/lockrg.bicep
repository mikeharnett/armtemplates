

resource rglock 'Microsoft.Authorization/locks@2020-05-01' = {
  name: 'rglock'
  properties: {
    level:  'CanNotDelete'
  }
}
