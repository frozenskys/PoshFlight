# MSP Types

Cleanflight includes a number of extensions to the MultiWii Serial Protocol (MSP). This document describes 
those extensions in order that 3rd party tools may identify cleanflight firmware and react appropriately.

Issue the MSP_API_VERSION command to find out if the firmware supports them.

## BoardInfo

| Data | Type | API Version | Notes |
|------|------|------|-------|
| Identifier | String(4) | 1.x | |
| Version | UInt16 | 1.x | |
| Type | Uint8 | 1.35 | Board Type Enum |
| Capabilities | Uint8 | 1.37 | Board Capabilities Flag |
| TargetNameLength | Uint8 | 1.37 | Length of the Target Name |
| TargetName | String | 1.37 | |
| NameLength | Uint8 | 1.37 | Length of the Name |
| Name | String | 1.37 | |
| ManufacturerIDLength | Uint8 | 1.37 | Length of the ManufacturerID |
| ManufacturerID | String | 1.39 | |
| Signature | String | 1.39 | 32 Bytes Long|
| MCUType | Uint8 | 1.41 | MCU Type Enum |
| ConfigurationState | UInt8 | 1.42 | Configuration State Enum |

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

## StatusEx

| Data | Type | API Version | Notes |
|------|------|------|-------|
| CycleTime | Uint16 | 1.x | CPU Cycle time |
| I2cError | Uint16 | 1.x | i2c Error count |
| ActiveSensors | Uint16 | 1.x | Sensors Flag |
| Mode | Uint32 | 1.x | Flight Mode Flags ? |
| Profile | Uint8 | 1.x | Current PID Profile Index |
| CpuLoad | Uint16 | 1.x | Percentage CPU Load |
| ProfileCount | Uint8 | 1.16 | Count of PID Profiles |
| RateProfile | Uint8 | 1.16 | Current Rate Profile Index |
| FlightModeLength | Uint8 | 1.36 | Number of bytes of FlightModeFlags |
| FlightModes | Uint8(count) | 1.36 | Flight Mode Flags |
| ArmingDisableCount | Uint8 | 1.36 | Number of Possible Arming Disable Flags |
| ArmingDisableFlags | Uint32 | 1.36 | Arming Disabled Flag |
| ConfigFlags | Uint8 | ?? | Maybe Reboot Required |

## ModeRanges
| Data | Type | API Version | Notes |
|------|------|------|-------|
| Id | Uint8 | 1.x | |
| AuxChannelIndex | Uint8 | 1.x | |
| RangeStart | Uint8 | 1.x | |
| RangeEnd | Uint8 | 1.x | |