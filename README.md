### KQL Query (Example)
```kql
SecurityAlert
| where ProviderName == "Microsoft Defender for Cloud"
| summarize count() by AlertName
60-sec Demo
<img src="https://cdn.loom.com/sessions/thumbnails/xxx-with-play.gif" alt="Loom Demo" width="600"/>

Deploy
bashterraform apply -var 'location=uaenorth'

infra/main.tf
hclterraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "sentinel" {
  name     = "sentinel-uae-north-rg"
  location = "uaenorth"
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = "sentinel-law-uae"
  location            = azurerm_resource_group.sentinel.location
  resource_group_name = azurerm_resource_group.sentinel.name
  sku                 = "PerGB2018"
}

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel" {
  workspace_id = azurerm_log_analytics_workspace.law.id
}

kql/phishing-alert.kql
kqlSigninLogs
| where ResultType == 0
| where IPAddress has "malicious-ip"
| extend Country = tostring(geo_info_from_ip_address(IPAddress).country)
| where Country in ("AE", "SA", "QA")
| project TimeGenerated, UserPrincipalName, IPAddress, Country

---

## NESA AM-03 Compliance
- **Control**: AM-03 (Analytics & Monitoring)
- **Evidence**: KQL rules + Terraform-provisioned Sentinel workspace in `uaenorth`

---

**Portfolio-Ready | 0 → 1 Cloud Project | UAE North**

Quick Deploy
bashterraform init
terraform apply -auto-approve
