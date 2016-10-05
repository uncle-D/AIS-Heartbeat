## Heartbeat for AIS Clients ##
## Derrick Lamp ##

$ErrorActionPreference = "SilentlyContinue"

## Service Tag From BIOS
    $bios = Get-WmiObject win32_bios
    $serviceTag = $bios.serialnumber

## Make/Model from ComputerSystem
    $info = Get-WmiObject win32_ComputerSystem
    $model = $info.model
    $make = $info.manufacturer

## Operating System
    $os = Get-WmiObject win32_OperatingSystem
    $os = $os.Caption

## Processor Arch from Environment variable
    $arch = $env:PROCESSOR_ARCHITECTURE

## Getting Antivirus Product & Status
    $antiV = (Get-WmiObject -Namespace Root\SecurityCenter2 -Class AntiVirusProduct)
    
    Switch ($antiV.ProductState)
    {

        "262144" {$defstatus = "Up to date" ;$rtstatus = "Disabled"} 
        "262160" {$defstatus = "Out of date" ;$rtstatus = "Disabled"} 
        "266240" {$defstatus = "Up to date" ;$rtstatus = "Enabled"} 
        "266256" {$defstatus = "Out of date" ;$rtstatus = "Enabled"} 
        "393216" {$defstatus = "Up to date" ;$rtstatus = "Disabled"} 
        "393232" {$defstatus = "Out of date" ;$rtstatus = "Disabled"} 
        "393488" {$defstatus = "Out of date" ;$rtstatus = "Disabled"} 
        "397312" {$defstatus = "Up to date" ;$rtstatus = "Enabled"} 
        "397328" {$defstatus = "Out of date" ;$rtstatus = "Enabled"} 
        "397584" {$defstatus = "Out of date" ;$rtstatus = "Enabled"} 
        "397568" {$defstatus = "Up to date"; $rtstatus = "Enabled"}
        "393472" {$defstatus = "Up to date" ;$rtstatus = "Disabled"}    

    }


    $computername = $env:COMPUTERNAME

    $serviceTag
    $heartbeat
    $os
    $arch
    $model
    $make
    $computername
    $antiV.DisplayName
    $defstatus
    $rtstatus

   
    #$url = "http://www.apprenticeis.com/api/heartbeat?Make=$make&Model=$model&service_tag=$serviceTag&ComputerName=$computername&OperatingSystem=$os"
    #
    #
    #$request = [System.Net.WebRequest]::Create("$url")
    #$request.ContentType='application/json; charset=utf-8'
    #$request.GetResponse()
    #$message = $request.GetResponse()
    #$message = $message.ResponseURI.Query
    #$message = $message | Out-String

    
