# MSP Types

Cleanflight includes a number of extensions to the MultiWii Serial Protocol (MSP). This document describes 
those extensions in order that 3rd party tools may identify cleanflight firmware and react appropriately.

Issue the MSP_API_VERSION command to find out if the firmware supports them.

## BoardInfo

| Data | Type | API Version | Notes |
|------|------|------|-------|
| Identifier | String(4) | 1.x | |
| Version | UInt16 | 1.x | |
| Type | Uint8 | 1.35 | |
| Capabilities | Uint8 | 1.37 | Flags? |
| TargetNameLength | Uint8 | 1.37 | Length of the Target Name |
| TargetName | String | 1.37 | |
| NameLength | Uint8 | 1.37 | Length of the Name |
| Name | String | 1.37 | |
| ManufacturerIDLength | Uint8 | 1.37 | Length of the ManufacturerID |
| ManufacturerID | String | 1.39 | |
| Signature | String | 1.39 | 32 Bytes Long|
| MCUType | Uint8 | 1.41 | Enum |
| ConfigurationState| UInt8 | 1.42 | Flags? |

## BuildInfo

| Data | Type | API Version | Notes |
|------|------|------|-------|
| Date | String(11) | 1.x | |
| Time | String(8) | 1.x | |
| CommitHash | String(7) | Unknown | |

## BatteryConfig

| Data | Type | API Version | Notes |
|------|------|------|-------|
| VBatMinCellVoltage | Uint8 | 1.x | 0.1 Accuracy |
| VBatMaxCellVoltage | Uint8 | 1.x | 0.1 Accuracy |
| VBatWarningCellVoltage | Uint8 | 1.x | 0.1 Accuracy |
| Capacity | Uint16 | 1.x | |
| VoltageMeterSource | Uint8 | 1.x | |
| CurrentMeterSource | Uint8 | 1.x | |
| VBatMinCellVoltage | Uint16 | 1.41 | 0.01 Accuracy |
| VBatMaxCellVoltage | Uint16 | 1.41 | 0.01 Accuracy |
| VBatWarningCellVoltage | Uint16 | 1.41 | 0.01 Accuracy |
