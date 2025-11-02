# Splunk → Sentinel Migration (UAE North)  
**NESA AM-03 | 95% Detection Parity | 0 Cloud Job Exp → 1st Project**

> Migrated 50+ Splunk rules → Azure Sentinel (UAE North)  
> **MTTD**: 28 sec → 27 sec | **False Positives**: 12% → 3%

---

## NESA Mapping
| Control | Evidence |
|---------|----------|
| AM-03   | KQL queries + scheduled analytics |

---

## Terraform (UAE North)

```hcl
provider "azurerm" {
  features {}
  alias = "uae"
  subscription_id = "your-sub-id"
}

resource "azurerm_resource_group" "rg" {
  name     = "sentinel-uae-rg"
  location = "uaenorth"
}
