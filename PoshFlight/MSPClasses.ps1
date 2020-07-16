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
    [ValidateNotNullOrEmpty()][string]$BoardName
    [ValidateNotNullOrEmpty()][string]$ManufacturerID
    [ValidateNotNullOrEmpty()][string]$Signature
    [ValidateNotNullOrEmpty()][MCUType]$MCUType
    [CONFIGURATIONSTATE]$ConfigState
}