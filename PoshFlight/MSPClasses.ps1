class MSPBuildInfo
{
    # Optionally, add attributes to prevent invalid values
    [ValidateNotNullOrEmpty()][string]$Date
    [ValidateNotNullOrEmpty()][string]$Time
    [ValidateNotNullOrEmpty()][string]$CommitHash
}

class MSPBoardInfo
{
    # Optionally, add attributes to prevent invalid values
    [ValidateNotNullOrEmpty()][string]$Identifier
    [ValidateNotNullOrEmpty()][string]$Version
    [ValidateNotNullOrEmpty()][string]$Type
    [ValidateNotNullOrEmpty()][byte]$Capabilities
    [ValidateNotNullOrEmpty()][string]$TargetName
    [ValidateNotNullOrEmpty()][string]$Name
    [ValidateNotNullOrEmpty()][string]$ManufacturerID
    [ValidateNotNullOrEmpty()][string]$Signature
    [ValidateNotNullOrEmpty()][McuType]$MCUType
    [ValidateNotNullOrEmpty()][ConfigurationState]$ConfigurationState
}

class MSPStatusEx
{
    [ValidateNotNullOrEmpty()][int]$CycleTime
    [ValidateNotNullOrEmpty()][int]$I2cError
    [ValidateNotNullOrEmpty()][int]$ActiveSensors
    [ValidateNotNullOrEmpty()][int]$Mode
    [ValidateNotNullOrEmpty()][int]$Profile
    [ValidateNotNullOrEmpty()][string]$CpuLoad
    [ValidateNotNullOrEmpty()][int]$ProfileCount
    [ValidateNotNullOrEmpty()][int]$RateProfile
    [ValidateNotNullOrEmpty()][int]$ArmingDisableCount
    [ValidateNotNullOrEmpty()][int]$ArmingDisableFlags
    [ValidateNotNullOrEmpty()][bool]$ArmingDisabled
}

class FlightControllerConfig
{
    [ValidateNotNullOrEmpty()][version]$apiVersion
    [ValidateNotNullOrEmpty()][string]$flightControllerIdentifier
    [ValidateNotNullOrEmpty()][string]$flightControllerVersion
    [ValidateNotNullOrEmpty()][string]$version
    [ValidateNotNullOrEmpty()][string]$buildInfo
    [ValidateNotNullOrEmpty()][int]$multiType
    [ValidateNotNullOrEmpty()][int]$msp_version
    [ValidateNotNullOrEmpty()][string]$capability
    [ValidateNotNullOrEmpty()][int]$cycleTime
    [ValidateNotNullOrEmpty()][int]$i2cError
    [ValidateNotNullOrEmpty()][int]$activeSensors
    [ValidateNotNullOrEmpty()][int]$mode
    [ValidateNotNullOrEmpty()][int]$profile
    [ValidateNotNullOrEmpty()][string]$name
    [ValidateNotNullOrEmpty()][string]$displayName
    [ValidateNotNullOrEmpty()][int]$numProfiles
    [ValidateNotNullOrEmpty()][int]$rateProfile
    [ValidateNotNullOrEmpty()][int]$armingDisableCount
    [ValidateNotNullOrEmpty()][int]$armingDisableFlags
    [ValidateNotNullOrEmpty()][bool]$armingDisabled
    [ValidateNotNullOrEmpty()][bool]$runawayTakeoffPreventionDisabled
    [ValidateNotNullOrEmpty()][string]$BoardIdentifier
    [ValidateNotNullOrEmpty()][string]$BoardVersion
    [ValidateNotNullOrEmpty()][int]$BoardType
    [ValidateNotNullOrEmpty()][byte]$BoardCapabilities
    [ValidateNotNullOrEmpty()][string]$TargetName
    [ValidateNotNullOrEmpty()][string]$BoardName
    [ValidateNotNullOrEmpty()][string]$ManufacturerID
    [ValidateNotNullOrEmpty()][string]$Signature
    [ValidateNotNullOrEmpty()][McuType]$MCUType
    [ValidateNotNullOrEmpty()][ConfigurationState]$ConfigurationState
    [ValidateNotNullOrEmpty()][int]$SampleRateHz
    [ValidateNotNullOrEmpty()][int]$ConfigurationProblems
}

class BatteryConfig
{
    [ValidateNotNullOrEmpty()][string]$VBatMinCellVoltage
    [ValidateNotNullOrEmpty()][string]$VBatMaxCellVoltage
    [ValidateNotNullOrEmpty()][string]$VBatWarningCellVoltage
    [ValidateNotNullOrEmpty()][string]$Capacity
    [ValidateNotNullOrEmpty()][string]$VoltageMeterSource
    [ValidateNotNullOrEmpty()][string]$CurrentMeterSource
}