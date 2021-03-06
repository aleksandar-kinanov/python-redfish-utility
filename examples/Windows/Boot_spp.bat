::    RESTful Interface Tool Sample Script for HPE iLO Products    ::
::  Copyright 2014, 2020 Hewlett Packard Enterprise Development LP ::

:: Description:  This is a sample batch script to mount the SPP    ::
::               media image, reboot the system, and boot to it.   ::

:: NOTE:  You will need to replace the USER_LOGIN and PASSWORD     ::
::        values with values that are appropriate for your         ::
::        environment.                                             ::

::        Firmware support information for this script:            ::
::            iLO 5 - All versions                                 ::
::            iLO 4 - All versions.                                ::

@echo off
set argC=0
for %%x in (%*) do Set /A argC+=1
if %argC% EQU 3 goto :remote
if %argC% EQU 0 goto :local
goto :error

:local
ilorest virtualmedia 2 http://xx.xx.xx.xx/images/media.iso --bootnextreset --reboot=ForceRestart
ilorest logout
goto :exit
:remote
ilorest virtualmedia 2 http://xx.xx.xx.xx/images/media.iso --bootnextreset --reboot=ForceRestart --url=%1 -u %2 -p %3
ilorest logout
goto :exit

:error
echo Usage:
echo        remote: Boot_spp.bat ^<iLO url^> ^<iLO username^>  ^<iLO password^>
echo        local:  Boot_spp.bat

:exit