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
    [ValidateNotNullOrEmpty()][Uint16]$HardwareRevision
    [ValidateNotNullOrEmpty()][BoardType]$Type
    [ValidateNotNullOrEmpty()][CapabilitiesFlag]$Capabilities
    [ValidateNotNullOrEmpty()][string]$TargetName
    [ValidateNotNullOrEmpty()][string]$Name
    [ValidateNotNullOrEmpty()][string]$ManufacturerID
    [ValidateNotNullOrEmpty()][string]$Signature
    [ValidateNotNullOrEmpty()][McuType]$MCUType
    [ValidateNotNullOrEmpty()][ConfigurationState]$ConfigurationState
    [ValidateNotNullOrEmpty()][uint16]$GyroSampleRateHz
}

class MSPStatusEx
{
    [ValidateNotNullOrEmpty()][int]$CycleTime
    [ValidateNotNullOrEmpty()][int]$I2cError
    [ValidateNotNullOrEmpty()][SensorsFlag]$ActiveSensors
    [ValidateNotNullOrEmpty()][int]$Mode
    [ValidateNotNullOrEmpty()][int]$Profile
    [ValidateNotNullOrEmpty()][string]$CpuLoad
    [ValidateNotNullOrEmpty()][int]$ProfileCount
    [ValidateNotNullOrEmpty()][int]$RateProfile
    [ValidateNotNullOrEmpty()][int]$ArmingDisableCount
    [ValidateNotNullOrEmpty()][ArmingDisabledFlags]$ArmingDisableFlags
    [ValidateNotNullOrEmpty()][StatusExConfigState]$ConfigFlags
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

class ModeRange
{
    [ValidateNotNullOrEmpty()][string]$Index
    [ValidateNotNullOrEmpty()][string]$BoxId
    [ValidateNotNullOrEmpty()][string]$BoxName
    [ValidateNotNullOrEmpty()][string]$AuxChannelIndex
    [ValidateNotNullOrEmpty()][string]$ModeLogic
    [ValidateNotNullOrEmpty()][string]$linkedTo
    [ValidateNotNullOrEmpty()][string]$RangeStart
    [ValidateNotNullOrEmpty()][string]$RangeEnd
}

class Box
{
    [ValidateNotNullOrEmpty()][byte]$BoxId
    [ValidateNotNullOrEmpty()][string]$Name
}

class RXConfig
{
    [ValidateNotNullOrEmpty()][string]$serialrx_provider
    [ValidateNotNullOrEmpty()][string]$stick_max
    [ValidateNotNullOrEmpty()][string]$stick_center
    [ValidateNotNullOrEmpty()][string]$stick_min
    [ValidateNotNullOrEmpty()][string]$spektrum_sat_bind
    [ValidateNotNullOrEmpty()][string]$rx_min_usec
    [ValidateNotNullOrEmpty()][string]$rx_max_usec
    [ValidateNotNullOrEmpty()][string]$rcInterpolation
    [ValidateNotNullOrEmpty()][string]$rcInterpolationInterval
    [ValidateNotNullOrEmpty()][string]$airModeActivateThreshold
    [ValidateNotNullOrEmpty()][string]$rxSpiProtocol
    [ValidateNotNullOrEmpty()][string]$rxSpiId
    [ValidateNotNullOrEmpty()][string]$rxSpiRfChannelCount
    [ValidateNotNullOrEmpty()][string]$fpvCamAngleDegrees
    [ValidateNotNullOrEmpty()][string]$rcInterpolationChannels
    [ValidateNotNullOrEmpty()][string]$rcSmoothingType
    [ValidateNotNullOrEmpty()][string]$rcSmoothingInputCutoff
    [ValidateNotNullOrEmpty()][string]$rcSmoothingDerivativeCutoff
    [ValidateNotNullOrEmpty()][string]$rcSmoothingInputType
    [ValidateNotNullOrEmpty()][string]$rcSmoothingDerivativeType
    [ValidateNotNullOrEmpty()][string]$usbCdcHidType
    [ValidateNotNullOrEmpty()][string]$rcSmoothingAutoSmoothness
}