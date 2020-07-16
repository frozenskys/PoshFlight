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

Enum CapabilitiesFlag {
    HAS_VCP= 0
    HAS_SOFTSERIAL= 1
    IS_UNIFIED= 2
    HAS_FLASH_BOOTLOADER= 3
    SUPPORTS_CUSTOM_DEFAULTS= 4
    HAS_CUSTOM_DEFAULTS= 5
    SUPPORTS_RX_BIND= 6
}