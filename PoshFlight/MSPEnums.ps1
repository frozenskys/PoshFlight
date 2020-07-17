Enum McuType 
{
    SIMULATOR = 0
    F103 = 1
    F303 = 2
    F40X = 3
    F411 = 4
    F446 = 5
    F722 = 6
    F745 = 7
    F746 = 8
    F765 = 9
    Unknown = 255
}

Enum ConfigurationState {
    Defaults_Bare =  0
    Defaults_Custom = 1
    Configured = 2
    Unknown = 255
}

Enum BoardType {
    NO_OSD = 0
    MAX7456 = 2
}

[flags()]
Enum CapabilitiesFlag {
    HAS_VCP= 1
    HAS_SOFTSERIAL= 2
    IS_UNIFIED= 4
    HAS_FLASH_BOOTLOADER= 8
    SUPPORTS_CUSTOM_DEFAULTS= 16
    HAS_CUSTOM_DEFAULTS= 32
    SUPPORTS_RX_BIND= 64
}


[flags()]
Enum SensorsFlag {
    SENSOR_ACC= 1
    SENSOR_BARO= 2
    SENSOR_MAG= 4
    SENSOR_GPS= 8
    SENSOR_RANGEFINDER= 16
    SENSOR_GYRO= 32
}