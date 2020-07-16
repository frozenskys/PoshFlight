﻿[string]$Global:ComPort = $null
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