# PoshFlight

## Aim

The aim is to provide a cross platform (anything that can run powershell\net core) cli interface for comunicating with xFlight systems (BetaFlight, EMUFLight, iNAV, CleanFlight, etc.) I'm starting with Betaflight compatibility, as that's the software I know the best, and plan to try and document the MultiWii Serial Protocol commands as I go along.

## Implemented Commands

### Setup Commands

The follwoing commands are used to get/set the port for communicating to the flight controller

- Get-ComPort
- Set-ComPort

### Public Commands

- Get-BoardInfo
- Get-BuildInfo
- Get-FCVariant
- Get-FCVersion
- Get-StatusEx
- Get-FCName
- Set-FCName
- Get-BatteryConfig
- Set-BatteryConfig
- Get-Boxes
- Get-ModeRanges
- Set-ModeRange
- Get-RXConfig

### Internal Commands

These commands are mainly intended for development and/or internal use - They have been made public as you might have use for them as well.

- Get-MSPAPIVersion
- Get-BoxNames
- Get-BoxIds

## Example

```Powershell
Import-Module PoshFlight
Get-COMPort -listAvailable
Set-COMPort COM3
Get-FCVariant
```
