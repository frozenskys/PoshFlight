function DecodeBoardInfo{
    [cmdletbinding()]
    Param(
        [byte[]]$databytes
    )
    Write-Verbose "API Version: $Global:MSPAPIVersion"
    $Identifier = [string]([System.Text.Encoding]::ASCII.GetString($databytes[8..11]))
    Write-Verbose "Board Identifier: $Identifier"
    $version = [System.BitConverter]::ToUInt16($databytes,12)
    Write-Verbose "Board Version: $version"
    if($Global:MSPAPIVersion -ge [version]::new(1,35,0)){
        $boardtype = [int]($databytes[14])
    }else{
        $boardtype = 0
    }
    Write-Verbose "Board Type: $boardtype"
    if($Global:MSPAPIVersion -ge [version]::new(1,37,0)){
        $capabilities = [int]($databytes[15])
        [int]$tnameend = 16 + [int]($databytes[16])
        $targetname = [string]([System.Text.Encoding]::ASCII.GetString($databytes[17..$tnameend]))
    }else{
        $capabilities = 0
        $targetname = ''
    }
    Write-Verbose "Board Capabilitiess: $capabilities"
    Write-Verbose "Target Name: $targetname"
    if($Global:MSPAPIVersion -ge [version]::new(1,39,0)){
        [int]$bnameend = $tnameend + [int]($databytes[$tnameend+1]) + 1
        [int]$mnameend = $bnameend + [int]($databytes[$bnameend+1]) + 1
        [int]$sigend = [int]$mnameend+32
        $boardname = [string]([System.Text.Encoding]::ASCII.GetString($databytes[([int]$tnameend+2)..$bnameend]))
        $manufacturer = [string]([System.Text.Encoding]::ASCII.GetString($databytes[([int]$bnameend+2)..$mnameend]))
        $signature = [string]([System.Text.Encoding]::ASCII.GetString($databytes[([int]$mnameend+1)..$sigend]))
    }else{
        $boardname = ''
        $manufacturer = ''
        $signature = ''
    }
    Write-Verbose "Board Name: $boardname"
    Write-Verbose "Manufacturer: $manufacturer"
    Write-Verbose "Signature: $signature"
    if($Global:MSPAPIVersion -ge [version]::new(1,41,0)){
        [MCUType]$mcuType = [MCUType]($databytes[[int]$sigend+1])
    }else{
        [MCUType]$mcuType = 255
    }
    Write-Verbose "MCU Type: $mcuType"
    if($Global:MSPAPIVersion -ge [version]::new(1,42,0)){
        [CONFIGURATIONSTATE]$configState = [CONFIGURATIONSTATE]($databytes[[int]$sigend+2])
    }else{
        [CONFIGURATIONSTATE]$configState = 255
    }
    Write-Verbose "Configuration State: $configState"
    $info = [MSPBoardInfo]@{
        Identifier = $Identifier
        Version = $version
        Type = $boardtype
        Capabilities = $capabilities
        TargetName = $targetname
        BoardName = $boardname
        ManufacturerID = $manufacturer
        Signature = $signature
        MCUType = $mcuType
        ConfigState = $configState
    }
    return $info
}