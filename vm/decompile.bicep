param vaults_nfekeyvault099_name string = 'nfekeyvault099'

resource vaults_nfekeyvault099_name_resource 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: vaults_nfekeyvault099_name
  location: 'uksouth'
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: '881e7333-8494-4eff-aeaf-fb3a050fbe3b'
    accessPolicies: []
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: true
    enablePurgeProtection: true
    vaultUri: 'https://${vaults_nfekeyvault099_name}.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

resource vaults_nfekeyvault099_name_sqlDBaccess 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: vaults_nfekeyvault099_name_resource
  name: 'sqlDBaccess'
  location: 'uksouth'
  properties: {
    attributes: {
      enabled: true
    }
  }
}