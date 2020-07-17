function DecodeBoardInfo{
    [cmdletbinding()]
    Param(
        [byte[]]$databytes
    )
    Write-Verbose "API Version: $Global:MSPAPIVersion"
    $ns = [System.BitConverter]::ToString($databytes[8..($databytes.Length -2)])
    write-verbose "Decoding: $ns"
    $Identifier = [string]([System.Text.Encoding]::ASCII.GetString($databytes[8..11]))
    Write-Verbose "Board Identifier: $Identifier"
    $version = [System.BitConverter]::ToUInt16($databytes,12)
    Write-Verbose "Hardware Revision: $version"
    if($Global:MSPAPIVersion -ge [version]::new(1,35,0)){
        $boardtype = [BoardType]($databytes[14])
    }else{
        $boardtype = 0
    }
    Write-Verbose "Board Type: $boardtype"
    if($Global:MSPAPIVersion -ge [version]::new(1,37,0)){
        $capabilities = [CapabilitiesFlag]($databytes[15])
        [int]$tnameend = 16 + [int]($databytes[16])
        $targetname = [string]([System.Text.Encoding]::ASCII.GetString($databytes[17..$tnameend]))
    }else{
        $capabilities = 0
        $targetname = ''
    }
    Write-Verbose "Board Capabilities: $capabilities"
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
        [McuType]$mcuType = [MCUType]($databytes[[int]$sigend+1])
    }else{
        [McuType]$mcuType = 255
    }
    Write-Verbose "MCU Type: $mcuType"
    if($Global:MSPAPIVersion -ge [version]::new(1,42,0)){
        [ConfigurationState]$configState = [ConfigurationState]($databytes[[int]$sigend+2])
    }else{
        [ConfigurationState]$configState = 255
    }
    Write-Verbose "Configuration State: $configState"
    if($Global:MSPAPIVersion -ge [version]::new(1,43,0)){
        [uint16]$gyrohz = [System.BitConverter]::ToUInt16($databytes,[int]$sigend+3)
    }else{
        [uint16]$gyrohz = 0
    }
    Write-Verbose "Gyro Sample Rate Hz: $gyrohz"
    $info = [MSPBoardInfo]@{
        Identifier = $Identifier
        HardwareRevision = $version
        Type = $boardtype
        Capabilities = $capabilities
        TargetName = $targetname
        Name = $boardname
        ManufacturerID = $manufacturer
        Signature = $signature
        MCUType = $mcuType
        ConfigurationState = $configState
        GyroSampleRateHz = $gyrohz
    }
    return $info
}

function DecodeStatusEx{
    [cmdletbinding()]
    Param(
        [byte[]]$databytes
    )
    Write-Verbose "API Version: $Global:MSPAPIVersion"
    $ns = [System.BitConverter]::ToString($databytes[8..($databytes.Length -2)])
    write-verbose "Decoding: $ns"
    $cycletime = [System.BitConverter]::ToUInt16($databytes,8)
    $i2cError = [System.BitConverter]::ToUInt16($databytes,10)
    $activeSensors = [SensorsFlag]([System.BitConverter]::ToUInt16($databytes,12))
    $mode = [System.BitConverter]::ToUInt32($databytes,14)
    $fcprofile = [int]($databytes[18])
    $cpuload =  [System.BitConverter]::ToUInt16($databytes,19)
    if($Global:MSPAPIVersion -ge [version]::new(1,16,0)){
        $profilecount = [int]($databytes[21])
        $rateprofile = [int]($databytes[22])
        if($Global:MSPAPIVersion -ge [version]::new(1,36,0)){
            $count = [int]($databytes[23])
            $disableCount  = [int]($databytes[24 + $count])
            $disableFlags = [ArmingDisabledFlags]([System.BitConverter]::ToUInt32($databytes, 25 + $count))
        }
    }
    $config = [StatusExConfigState]($databytes[25 + $count +1])
    $status = [MSPStatusEx]@{
        CycleTime = $cycletime
        I2cError = $i2cError
        ActiveSensors = $activeSensors
        Mode = $mode
        Profile = $fcprofile
        CPULoad = $cpuload
        ProfileCount = $profilecount
        RateProfile = $rateprofile
        ArmingDisableCount = $disableCount
        ArmingDisableFlags = $disableFlags
        ConfigFlags = $config
    }
    return $status
}

function DecodeBatteryConfig {
    [cmdletbinding()]
    Param(
        [byte[]]$databytes
    )
    Write-Verbose "API Version: $Global:MSPAPIVersion"
    $ns = [System.BitConverter]::ToString($databytes[8..($databytes.Length -2)])
    write-verbose "Decoding: $ns"
    $VBatMinCellVoltage = [int]($databytes[8]) / 10
    $VBatMaxCellVoltage = [int]($databytes[9]) / 10
    $VBatWarningCellVoltage = [int]($databytes[10]) / 10
    $Capacity = [System.BitConverter]::ToUInt16($databytes,11)
    $VoltageMeterSource = [int]($databytes[13])
    $CurrentMeterSource = [int]($databytes[14])
    if($Global:MSPAPIVersion -ge [version]::new(1,41,0)){
        $VBatMinCellVoltage = [System.BitConverter]::ToUInt16($databytes,15) / 100
        $VBatMaxCellVoltage = [System.BitConverter]::ToUInt16($databytes,17) / 100
        $VBatWarningCellVoltage = [System.BitConverter]::ToUInt16($databytes,19) / 100
    }
    $config = [BatteryConfig]@{
        VBatMinCellVoltage = $VBatMinCellVoltage
        VBatMaxCellVoltage = $VBatMaxCellVoltage
        VBatWarningCellVoltage = $VBatWarningCellVoltage
        Capacity = $Capacity
        VoltageMeterSource = $VoltageMeterSource
        CurrentMeterSource = $CurrentMeterSource
    }
    return $config
}

function EncodeBatteryConfig {
    [cmdletbinding()]
    Param(
        [BatteryConfig]$config
    )
    [byte[]]$data = [byte]$([int]([decimal]$config.VBatMinCellVoltage * 10))
    $data += ([byte]$([int]([decimal]$config.VBatMaxCellVoltage * 10)))
    $data += ([byte]$([int]([decimal]$config.VBatWarningCellVoltage * 10)))
    $data += [System.BitConverter]::GetBytes($([int16]([decimal]$config.Capacity)))
    $data += ([byte]$([int]([decimal]$config.VoltageMeterSource)))
    $data += ([byte]$([int]([decimal]$config.CurrentMeterSource)))
    if($Global:MSPAPIVersion -ge [version]::new(1,41,0)){
        $data += [System.BitConverter]::GetBytes($([int16]([decimal]$config.VBatMinCellVoltage * 100)))
        $data += [System.BitConverter]::GetBytes($([int16]([decimal]$config.VBatMaxCellVoltage * 100)))
        $data += [System.BitConverter]::GetBytes($([int16]([decimal]$config.VBatWarningCellVoltage * 100)))
    }
    $ns = [System.BitConverter]::ToString($data)
    write-verbose "Encoded: $ns"
    return $data
}