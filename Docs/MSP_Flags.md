# MSP Flags

## Board Capabilities

| Capability | Flag | Value | Notes |
|------|------|------|-------|
| TARGET_HAS_VCP | 0 | 1 | |
| TARGET_HAS_SOFTSERIAL | 1 | 2 | |
| TARGET_IS_UNIFIED | 2 | 4 | |
| TARGET_HAS_FLASH_BOOTLOADER | 3 | 8 | |
| TARGET_SUPPORTS_CUSTOM_DEFAULTS | 4 | 16 | |
| TARGET_HAS_CUSTOM_DEFAULTS | 5 | 32 | |
| TARGET_SUPPORTS_RX_BIND | 6 | 64 | |

## Sensors

| Capability | Flag | Value | Notes |
|------|------|------|-------|
| SENSOR_ACC | 0 | 1 | |
| SENSOR_BARO | 1 | 2 | |
| SENSOR_MAG | 2 | 4 | |
| SENSOR_GPS | 3 | 8 | |
| SENSOR_RANGEFINDER | 4 | 16 | |
| SENSOR_GYRO | 5 | 32 | |

## Arming Disabled Flags

| Capability | Flag | Value | Notes |
|------|------|------|-------|
| ARMING_DISABLED_NO_GYRO | 0 | 1 | |
| ARMING_DISABLED_FAILSAFE | 1 | 2 | |
| ARMING_DISABLED_RX_FAILSAFE | 2 | 4 | |
| ARMING_DISABLED_BAD_RX_RECOVERY | 3 | 8 | |
| ARMING_DISABLED_BOXFAILSAFE | 4 | 16 | |
| ARMING_DISABLED_RUNAWAY_TAKEOFF | 5 | 32 | |
| ARMING_DISABLED_CRASH_DETECTED | 6 | 64 | |
| ARMING_DISABLED_THROTTLE | 7 | 128 | |
| ARMING_DISABLED_ANGLE | 8 | 256 | |
| ARMING_DISABLED_BOOT_GRACE_TIME | 9 | 512 | |
| ARMING_DISABLED_NOPREARM | 10 | 1024 | |
| ARMING_DISABLED_LOAD | 11 | 2048 | |
| ARMING_DISABLED_CALIBRATING | 12 | 4096 | |
| ARMING_DISABLED_CLI | 13 | 8192 | |
| ARMING_DISABLED_CMS_MENU | 14 | 16384 | |
| ARMING_DISABLED_BST | 15 | 32768 | |
| ARMING_DISABLED_MSP | 16 | 65536 | |
| ARMING_DISABLED_PARALYZE | 17 | 131072 | |
| ARMING_DISABLED_GPS | 18 | 262144 | |
| ARMING_DISABLED_RESC | 19 | 524288 | |
| ARMING_DISABLED_RPMFILTER | 20 | 1048576 | |
| ARMING_DISABLED_REBOOT_REQUIRED | 21 | 2097152 | |
| ARMING_DISABLED_DSHOT_BITBANG | 22 | 4194304 | |
| ARMING_DISABLED_ACC_CALIBRATION | 23 | 8388608 | |
| ARMING_DISABLED_MOTOR_PROTOCOL | 24 | 16777216 | |
| ARMING_DISABLED_ARM_SWITCH | 25 | 33554432 | Needs to be the last element, since it's always activated if one of the others is active when arming |

## StatusEx Config State

| Capability | Flag | Value | Notes |
|------|------|------|-------|
| RebootRequired | 0 | 1 | |