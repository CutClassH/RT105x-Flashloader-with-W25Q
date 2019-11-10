# RT105x-Flashloader-with-W25Q
此下载算法解决Jlink无法将程序下载到NXP RT105x核心板的外置W25Q Flash上。\
由于手上的开发板和Jlink限制，只测试了一种Jlink，一款开发板。
* Jlink型号为[Jlink edu mini](https://www.segger.com/products/debug-probes/j-link/models/j-link-edu-mini/)
* 开发板是[飞凌FET1052-C核心板](http://www.forlinx.com/99.htm) 

理论上只要开发板同样的Flash，都是支持的。加入此下载算法之后，实测可以使用MCUXpresso 和 Embedded Studio下载调试。

## 下载算法使用
1.下载flashloader [RT105x_W25Q.elf](https://github.com/CutClassH/RT105x-Flashloader-with-W25Q/releases/download/v0.0.1/RT105x_W25Q.elf)

2.将文件复制到 *$(JLink_DIR)/Devices/NXP/iMXRT105x*目录下，Jlink_DIR为Jlink的安装路径。
* 如果安装了多个版本的Jlink驱动，注意选择你的MCUXpresso IDE使用的Jlink版本。
* 如果使用的IDE是Embedded Studio，则Jlink的安装路径就是IDE的安装路径.
。

3.打开Jlink的安装路径下的JLinkDevices.xml，找到
```html
<Device>
    <ChipInfo Vendor="NXP" Name="MCIMXRT1052" WorkRAMAddr="0x20000000" WorkRAMSize="0x00080000" Core="JLINK_CORE_CORTEX_M7" JLinkScriptFile="Devices/NXP/iMXRT105x/NXP_iMXRT105x.pex" />
    <FlashBankInfo Name="HyperFlash" BaseAddr="0x60000000" MaxSize="0x04000000" Loader="Devices/NXP/iMXRT105x/NXP_iMXRT105x_HyperFlash.elf" LoaderType="FLASH_ALGO_TYPE_OPEN" />
  </Device>
```
更改为
```html
<Device>
    <ChipInfo Vendor="NXP" Name="MCIMXRT1052" WorkRAMAddr="0x20000000" WorkRAMSize="0x00080000" Core="JLINK_CORE_CORTEX_M7" JLinkScriptFile="Devices/NXP/iMXRT105x/NXP_iMXRT105x.pex" />
    <FlashBankInfo Name="QSPI Flash" BaseAddr="0x60000000" MaxSize="0x04000000" Loader="Devices/NXP/iMXRT105x/RT105x_W25Q.elf" LoaderType="FLASH_ALGO_TYPE_OPEN" />
  </Device>
```

4.在IDE中将Debuger Target配置为"MCIMXRT1052"。

## 源码说明

对于如何构建自定义的Jlink 下载算法，Segger的[wiki](https://wiki.segger.com/Open_Flashloader)有详细的说明。并且提供了embedded studio的工程模板。\
如果需要修改或者尝试自己编译这个工程，你需要下载安装[Embedded Studio 4.30](https://www.segger.com/downloads/embedded-studio/)。
这个工程提供了两个工程配置，debug用于调试程序，release用于编译生成下载算法。

