# MSP Commands

This document currently documents the Betaflight implentation of MSP as it stands at API version 1.43
The MSP_API_VERSION command can be used to find the API version of the device you are talking to.

## Command List (Betaflight)

| Command | ID | MSP Type | Notes |
|------|------|------|-------|
| MSP_API_VERSION | 1 | None | Gets the MSP API Version from the FC, can be used to check commands are supported etc. |
| MSP_FC_VARIANT | 2 | None | Gets the Variant of xFlight e.g. BetaFlight, CleanFlight, etc. |
| MSP_FC_VERSION | 3 | None | Gets the version of the xFlight Software |
| MSP_BOARD_INFO | 4 | BoardInfo | Gets information about the Flight Controller |
| MSP_BUILD_INFO | 5 | BuildInfo | Gets information about the xFlight software build |
| MSP_NAME | 10 | None | Gets the Craft Name (User set board name) |
| MSP_SET_NAME | 11 | None | Sets the Craft Name (User set board name) |
|   |   |   |   |
| MSP_BATTERY_CONFIG | 32 | BatteryConfig | Gets the battery info |
| MSP_SET_BATTERY_CONFIG | 33 | BatteryConfig | Sets the battery info |
| MSP_MODE_RANGES | 34 | ModeRange[] | |
| MSP_SET_MODE_RANGE | 35 | ModeRange | Will also handle mode_ranges_extra vaules |
|   |   |   |   |
| MSP_RX_CONFIG | 44 | RXConfig | |
|   |   |   |   |
| MSP_BOXNAMES | 116 | Box | Gets a list of all Aux Switch Names (BOXes) implemented as part of GetBoxes |
|   |   |   |   |
| MSP_BOXIDS | 119 | Box | Get the permanent IDs associated to BOXes implemented as part of GetBoxes |
|   |   |   |   |
| MSP_STATUS_EX | 150 | StatusEx | Gets the FC Status - cycletime, errors_count, CPU load, sensor present etc. |
|   |   |   |   |
| MSP_MODE_RANGES_EXTRA | 238 | ModeRange[] | Implemented as part of Get-ModeRanges in PoshFlight |
|   |   |   |   |

## Currently UnImplemented in PoshFlight

    MSP_FEATURE_CONFIG:             36,
    MSP_SET_FEATURE_CONFIG:         37,
    MSP_BOARD_ALIGNMENT_CONFIG:     38,
    MSP_SET_BOARD_ALIGNMENT_CONFIG: 39,
    MSP_CURRENT_METER_CONFIG:       40,
    MSP_SET_CURRENT_METER_CONFIG:   41,
    MSP_MIXER_CONFIG:               42,
    MSP_SET_MIXER_CONFIG:           43,
    MSP_SET_RX_CONFIG:              45,
    MSP_LED_COLORS:                 46,
    MSP_SET_LED_COLORS:             47,
    MSP_LED_STRIP_CONFIG:           48,
    MSP_SET_LED_STRIP_CONFIG:       49,
    MSP_RSSI_CONFIG:                50,
    MSP_SET_RSSI_CONFIG:            51,
    MSP_ADJUSTMENT_RANGES:          52,
    MSP_SET_ADJUSTMENT_RANGE:       53,
    MSP_CF_SERIAL_CONFIG:           54,
    MSP_SET_CF_SERIAL_CONFIG:       55,
    MSP_VOLTAGE_METER_CONFIG:       56,
    MSP_SET_VOLTAGE_METER_CONFIG:   57,
    MSP_SONAR:                      58,
    MSP_PID_CONTROLLER:             59,
    MSP_SET_PID_CONTROLLER:         60,
    MSP_ARMING_CONFIG:              61,
    MSP_SET_ARMING_CONFIG:          62,
    MSP_RX_MAP:                     64,
    MSP_SET_RX_MAP:                 65,
    MSP_SET_REBOOT:                 68,
    MSP_DATAFLASH_SUMMARY:          70,
    MSP_DATAFLASH_READ:             71,
    MSP_DATAFLASH_ERASE:            72,
    MSP_FAILSAFE_CONFIG:            75,
    MSP_SET_FAILSAFE_CONFIG:        76,
    MSP_RXFAIL_CONFIG:              77,
    MSP_SET_RXFAIL_CONFIG:          78,
    MSP_SDCARD_SUMMARY:             79,
    MSP_BLACKBOX_CONFIG:            80,
    MSP_SET_BLACKBOX_CONFIG:        81,
    MSP_TRANSPONDER_CONFIG:         82,
    MSP_SET_TRANSPONDER_CONFIG:     83,
    MSP_OSD_CONFIG:                 84,
    MSP_SET_OSD_CONFIG:             85,
    MSP_OSD_CHAR_READ:              86,
    MSP_OSD_CHAR_WRITE:             87,
    MSP_VTX_CONFIG:                 88,
    MSP_SET_VTX_CONFIG:             89,
    MSP_ADVANCED_CONFIG:            90,
    MSP_SET_ADVANCED_CONFIG:        91,
    MSP_FILTER_CONFIG:              92,
    MSP_SET_FILTER_CONFIG:          93,
    MSP_PID_ADVANCED:               94,
    MSP_SET_PID_ADVANCED:           95,
    MSP_SENSOR_CONFIG:              96,
    MSP_SET_SENSOR_CONFIG:          97,
    MSP_CAMERA_CONTROL:             98, 
    MSP_SET_ARMING_DISABLED:        99,
    MSP_STATUS:                     101,
    MSP_RAW_IMU:                    102,
    MSP_SERVO:                      103,
    MSP_MOTOR:                      104,
    MSP_RC:                         105,
    MSP_RAW_GPS:                    106,
    MSP_COMP_GPS:                   107,
    MSP_ATTITUDE:                   108,
    MSP_ALTITUDE:                   109,
    MSP_ANALOG:                     110,
    MSP_RC_TUNING:                  111,
    MSP_PID:                        112,
    MSP_PIDNAMES:                   117,
    MSP_WP:                         118, 
    MSP_SERVO_CONFIGURATIONS:       120,
    MSP_MOTOR_3D_CONFIG:            124,
    MSP_RC_DEADBAND:                125,
    MSP_SENSOR_ALIGNMENT:           126,
    MSP_LED_STRIP_MODECOLOR:        127,
    MSP_VOLTAGE_METERS:             128,
    MSP_CURRENT_METERS:             129,
    MSP_BATTERY_STATE:              130,
    MSP_MOTOR_CONFIG:               131,
    MSP_GPS_CONFIG:                 132,
    MSP_COMPASS_CONFIG:             133,
    MSP_GPS_RESCUE:                 135,
    MSP_VTXTABLE_BAND:              137,
    MSP_VTXTABLE_POWERLEVEL:        138,
    MSP_MOTOR_TELEMETRY:            139,
    MSP_UID:                        160,
    MSP_GPS_SV_INFO:                164,
    MSP_DISPLAYPORT:                182,
    MSP_COPY_PROFILE:               183,
    MSP_BEEPER_CONFIG:              184,
    MSP_SET_BEEPER_CONFIG:          185,
    MSP_SET_RAW_RC:                 200,
    MSP_SET_RAW_GPS:                201, 
    MSP_SET_PID:                    202,
    MSP_SET_RC_TUNING:              204,
    MSP_ACC_CALIBRATION:            205,
    MSP_MAG_CALIBRATION:            206,
    MSP_RESET_CONF:                 208,
    MSP_SET_WP:                     209, 
    MSP_SELECT_SETTING:             210,
    MSP_SET_HEADING:                211, 
    MSP_SET_SERVO_CONFIGURATION:    212,
    MSP_SET_MOTOR:                  214,
    MSP_SET_MOTOR_3D_CONFIG:        217,
    MSP_SET_RC_DEADBAND:            218,
    MSP_SET_RESET_CURR_PID:         219,
    MSP_SET_SENSOR_ALIGNMENT:       220,
    MSP_SET_LED_STRIP_MODECOLOR:    221,
    MSP_SET_MOTOR_CONFIG:           222,
    MSP_SET_GPS_CONFIG:             223,
    MSP_SET_COMPASS_CONFIG:         224,
    MSP_SET_GPS_RESCUE:             225,
    MSP_SET_VTXTABLE_BAND:          227,
    MSP_SET_VTXTABLE_POWERLEVEL:    228,
    MSP_MULTIPLE_MSP:               230,
    MSP_SET_ACC_TRIM:               239,
    MSP_ACC_TRIM:                   240,
    MSP_SERVO_MIX_RULES:            241,
    MSP_SET_SERVO_MIX_RULE:         242, 
    MSP_SET_PASSTHROUGH:            245,
    MSP_SET_RTC:                    246,
    MSP_RTC:                        247, 
    MSP_SET_BOARD_INFO:             248, 
    MSP_SET_SIGNATURE:              249, 
    MSP_EEPROM_WRITE:               250,
    MSP_DEBUGMSG:                   253, 
    MSP_DEBUG:                      254,
    MSP2_COMMON_SERIAL_CONFIG:      0x1009,
    MSP2_COMMON_SET_SERIAL_CONFIG:  0x100A,
    MSP2_BETAFLIGHT_BIND:           0x3000,
