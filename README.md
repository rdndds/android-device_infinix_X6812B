# Device tree for Infinix X6812B

```
#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
```

## About

This device tree provides support for the Infinix X6812B smartphone. The tree is based on the MediaTek MT6768 chipset platform and has been adapted for the Infinix X6812B device.

The Infinix X6812B is a budget smartphone from Infinix Mobility.

## Device Specifications

| Basic                   | Spec                                                        |
| ----------------------- | :---------------------------------------------------------- |
| SoC                     | MediaTek Helio G85 (12nm)                                   |
| CPU                     | 2 x 2.0 GHz Cortex-A75 & 6 x 1.8 GHz Cortex-A55             |
| GPU                     | Mali-G52 MC2                                                |
| Memory                  | 4GB / 6GB                                                   |
| Shipped Android version | 10                                                          |
| Storage                 | 64GB / 128GB                                                |
| MicroSD                 | Up to 256 GB                                                |
| Battery                 | Non-removable Li-Po 5200 mAh                                |
| Dimensions              | 164.9 x 76.6 x 8.9 mm                                       |
| Display                 | 2340 x 1080 (19.5:9), 6.82 inch                             |
| Rear Camera 1           | 48 MP, f/1.8, 26mm (wide), 1/2.0", 0.8µm, PDAF              |
| Rear Camera 2           | 2 MP, f/2.4, (depth)                                        |
| Front Camera            | 16 MP, f/2.0, 29mm (standard), 1/3.1", 1.12µm               |


## Device Picture

![Infinix X6812B](https://dl.dropboxusercontent.com/s/XXXXX/X6812B.jpg)

## How to build

```bash
# Set up environment
source build/envsetup.sh

# Choose lunch
lunch lineage_X6812B-userdebug

# Build
mka bacon
```

## Device-specific notes

- This device does NOT have NFC support
- Touchscreen firmware is included for recovery
- All proprietary blobs must be extracted from the device

## Copyright

```
#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
```
