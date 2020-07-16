function crc8_dvb_s2([byte]$crc, [byte]$a)
{
  $crc = $crc -bxor $a
  for($ii = 0; $ii -lt 8; ++$ii){
    if($crc -band 0x80){
      $crc = (($crc -shl 1) -bxor 0xD5)
    } else {
      $crc = $crc -shl 1
    }
  }
  return $crc
}

function simple_crc([byte]$datalength, [byte]$code)
{
    return $datalength -bxor $code
}

function get_v1_message{
    [cmdletbinding()]
    Param(
      [byte]$function,
      [byte[]]$databytes
    )
    $headertxt = '$M<'
    $encoding = [System.Text.Encoding]::UTF8
    [byte[]]$header = $encoding.GetBytes($headertxt)
    [byte[]]$data = [byte]$databytes.Length
    $data += $function
    foreach($b in $databytes){
      $data += $b
    }
    [byte]$checksum = simple_crc -datalength $data[0] -code $data[1]
    $bytes = $header + $data + $checksum
    $ns = [System.BitConverter]::ToString($bytes)
    write-verbose "$ns"
    return $bytes
}

function get_v2_Message{
    [cmdletbinding()]
    Param(
      [MSPCode]$function,
      [byte[]]$databytes
    )
    $v2headertxt = '$X<'
    $encoding = [System.Text.Encoding]::UTF8
    [byte[]]$v2header = $encoding.GetBytes($v2headertxt)
    [byte[]]$v2data = 0x00
    $v2data += [System.BitConverter]::GetBytes([int16]$function)
    $v2data += [System.BitConverter]::GetBytes([int16]$databytes.Length)
    if($null -ne $databytes){
      $v2data += $databytes
    }
    $v2checksum = [byte]0
    foreach($b in $v2data){
      $v2checksum = crc8_dvb_s2 -crc $v2checksum -a $b
    }
    $ret = $v2header + $v2data + $v2checksum
    $ns = [System.BitConverter]::ToString($ret)
    write-verbose "Created Message Bytes: $ns"
    return $ret
}

function send_message_and_get_response{
    [cmdletbinding()]
    Param($message,[string]$port)
    Write-Verbose "Opening Port: $port"
    $cport= new-Object System.IO.Ports.SerialPort $port,115200,None,8,one
    $cport.open()
    Write-Verbose "Sending..."
    $cport.Write([byte[]]$message, 0, $message.Length)
    $cport.ReadTimeout = 1000
    [byte[]]$outbytes = $null
    start-sleep -Milliseconds 100
    Write-Verbose "Recieving..."
    while($cport.BytesToRead -gt 0){
        $outbytes += $cport.ReadByte()
    }
    $cport.close()
    Write-Verbose "Closed Port: $port"
    $ns = [System.BitConverter]::ToString($outbytes)
    write-verbose "Recieved Message Bytes: $ns"
    return $outbytes
}