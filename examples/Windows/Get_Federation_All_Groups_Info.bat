::    RESTful Interface Tool Sample Script for HPE iLO Products    ::
::  Copyright 2014, 2020 Hewlett Packard Enterprise Development LP ::

:: Description:  This is a sample batch script to retrieve a list  ::
::               of all Federation group memberships and granted   ::
::               privileges.                                       ::

:: NOTE:  You will need to replace the USER_LOGIN and PASSWORD     ::
::        values with values that are appropriate for your         ::
::        environment.                                             ::

::        Firmware support information for this script:            ::
::            iLO 5 - All versions                                 ::
::            iLO 4 - 1.40 or later.                               ::

@echo off
set argC=0
for %%x in (%*) do Set /A argC+=1
if %argC% EQU 3 goto :remote
if %argC% EQU 0 goto :local
goto :error

:local
ilorest ilofederation -u USER_LOGIN -p PASSWORD
ilorest logout
goto :exit
:remote
ilorest ilofederation --url=%1 --user %2 --password %3
ilorest logout
goto :exit

:error
echo Usage:
echo        remote: Get_Federation_All_Groups_Info.bat ^<iLO url^> ^<iLO username^>  ^<iLO password^>
echo        local:  Get_Federation_All_Groups_Info.bat

:exit