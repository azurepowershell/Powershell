Break

#Get the Syntax for a resource

    Get-DscResource registry -Syntax

    Registry [String] #ResourceName
    {
        Key = [string]
        ValueName = [string]
        [DependsOn = [string[]]]
        [Ensure = [string]{ Absent | Present }]
        [Force = [bool]]
        [Hex = [bool]]
        [PsDscRunAsCredential = [PSCredential]]
        [ValueData = [string[]]]
        [ValueType = [string]{ Binary | Dword | ExpandString | MultiString | Qword | String }]
    }



# Remember to install Module if it is not a build in module and import it
    Configuration ResourceTest {
        Import-DscResource -ModuleName xPSDesireStateConfiguration, xSMBShare

    (...)