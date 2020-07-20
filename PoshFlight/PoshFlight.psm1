[string]$Global:ComPort = $null
[version]$Global:MSPAPIVersion = $null
function Get-ComPort([switch]$listavailable){
    if($listavailable){
        return [System.IO.Ports.SerialPort]::GetPortNames()
    }else{
        return $Global:ComPort
    }
}

function Set-ComPort{
    [cmdletbinding()]
    Param(
        [string]$name
    )
    $Global:ComPort  = $name
    Write-Verbose "ComPort set to : $Global:ComPort"
}

function Get-RawMSPResponse{
    [cmdletbinding()]
    Param(
        [MSPCode]$MSPfunction
    )
    [byte[]]$v2request = get_v2_message -function $MSPfunction -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
}

function Get-BoardInfo{
    [cmdletbinding()]
    Param()
    $null = Get-MSPAPIVersion -Verbose:$VerbosePreference
    [byte[]]$v2request = get_v2_message -function MSP_BOARD_INFO -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    Return DecodeBoardInfo -databytes $response -Verbose:$VerbosePreference
}

function Get-BuildInfo{
    [cmdletbinding()]
    Param()
    [byte[]]$v2request = get_v2_message -function MSP_BUILD_INFO -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    [byte[]]$response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    $info = [MSPBuildInfo]@{
        Date = [string]([System.Text.Encoding]::ASCII.GetString($response[8..18]))
        Time = [string]([System.Text.Encoding]::ASCII.GetString($response[19..26]))
        CommitHash = [string]([System.Text.Encoding]::ASCII.GetString($response[27..33]))
    }
    Return $info
}

function Get-MSPAPIVersion{
    [cmdletbinding()]
    Param()
    [byte[]]$v2request = get_v2_message -function MSP_API_VERSION -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    $version = [version]::new($response[9], $response[10], 0)
    $Global:MSPAPIVersion = $version
    return $Global:MSPAPIVersion
}

function Get-FCVariant{
    [cmdletbinding()]
    Param()
    [byte[]]$v2request = get_v2_message -function MSP_FC_VARIANT -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    return [string]([System.Text.Encoding]::ASCII.GetString($response[8..11]))
}

function Get-FCName{
    [cmdletbinding()]
    Param()
    [byte[]]$v2request = get_v2_message -function MSP_NAME -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    return [string]([System.Text.Encoding]::ASCII.GetString($response[8..($response.Length - 2)]))
}

function Set-FCName{
    [cmdletbinding()]
    Param(
        [string]$Name
    )
    $encoding = [System.Text.Encoding]::UTF8
    [byte[]]$namedata = $encoding.GetBytes($Name)
    [byte[]]$v2request = get_v2_message -function MSP_SET_NAME -databytes $namedata -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
}

function Get-FCVersion{
    [cmdletbinding()]
    Param()
    [byte[]]$v2request = get_v2_message -function MSP_FC_VERSION -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    $version = [version]::new($response[8], $response[9], $response[10])
    return $version
}

function Get-StatusEx{
    [cmdletbinding()]
    Param()
    $null = Get-MSPAPIVersion -Verbose:$VerbosePreference
    [byte[]]$v2request = get_v2_message -function MSP_STATUS_EX -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    Return DecodeStatusEx -databytes $response -Verbose:$VerbosePreference
}

function Get-BatteryConfig{
    [cmdletbinding()]
    Param()
    $null = Get-MSPAPIVersion -Verbose:$VerbosePreference
    [byte[]]$v2request = get_v2_message -function MSP_BATTERY_CONFIG -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    Return DecodeBatteryConfig -databytes $response -Verbose:$VerbosePreference
}

function Set-BatteryConfig{
    [cmdletbinding()]
    Param(
        [BatteryConfig]$config
    )
    $null = Get-MSPAPIVersion -Verbose:$VerbosePreference
    $data = EncodeBatteryConfig -config $config -Verbose:$VerbosePreference
    [byte[]]$v2request = get_v2_message -function MSP_SET_BATTERY_CONFIG -databytes $data -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
}

function Get-ModeRanges{
    [cmdletbinding()]
    Param()
    $null = Get-MSPAPIVersion -Verbose:$VerbosePreference
    [byte[]]$v2request = get_v2_message -function MSP_MODE_RANGES -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    $boxes = (Get-Boxes -Verbose:$VerbosePreference)
    $modes = DecodeModeRanges -databytes $response -boxes $boxes -Verbose:$VerbosePreference

    [byte[]]$v2request = get_v2_message -function MSP_MODE_RANGES_EXTRA -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    Return DecodeModeRangesExtra -databytes $response -moderanges $modes -Verbose:$VerbosePreference
}

function Set-ModeRange{
    [cmdletbinding()]
    Param(
        [ModeRange]$moderange
    )
    $null = Get-MSPAPIVersion -Verbose:$VerbosePreference
    $data = EncodeModeRange -moderange $moderange -Verbose:$VerbosePreference
    [byte[]]$v2request = get_v2_message -function MSP_SET_MODE_RANGE -databytes $data -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
}

function Get-BoxNames{
    [cmdletbinding()]
    Param()
    $null = Get-MSPAPIVersion -Verbose:$VerbosePreference
    [byte[]]$v2request = get_v2_message -function MSP_BOXNAMES -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    Return DecodeBoxNames -databytes $response -Verbose:$VerbosePreference
}

function Get-BoxIds{
    [cmdletbinding()]
    Param()
    $null = Get-MSPAPIVersion -Verbose:$VerbosePreference
    [byte[]]$v2request = get_v2_message -function MSP_BOXIDS -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    Return DecodeBoxIds -databytes $response -Verbose:$VerbosePreference
}

function Get-Boxes{
    [cmdletbinding()]
    Param()
    $null = Get-MSPAPIVersion -Verbose:$VerbosePreference
    [byte[]]$v2request = get_v2_message -function MSP_BOXNAMES -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    $boxes = DecodeBoxNames2 -databytes $response -Verbose:$VerbosePreference

    [byte[]]$v2request = get_v2_message -function MSP_BOXIDS -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    Return DecodeBoxIds2 -databytes $response -boxes $boxes -Verbose:$VerbosePreference
}

function Get-RXConfig{
    [cmdletbinding()]
    Param()
    $null = Get-MSPAPIVersion -Verbose:$VerbosePreference
    [byte[]]$v2request = get_v2_message -function MSP_RX_CONFIG -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($v2request))
    Write-Verbose "Sending: $ns"
    $response = send_message_and_get_response -message $v2request -port $Global:ComPort -Verbose:$VerbosePreference
    $ns = [string]([System.Text.Encoding]::ASCII.GetString($response))
    Write-Verbose "Recived: $ns"
    Return DecodeRXConfig -databytes $response -Verbose:$VerbosePreference
}