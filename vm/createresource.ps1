


New-AzResourceGroup -name servernfe2016 -Location "uksouth"

New-AzResourceGroupDeployment -ResourceGroupName "servernfe2016" -TemplateFile "./main.bicep"