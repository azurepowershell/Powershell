#Requires -version 5.0

Configuration ScriptFolder
{
    node 'localhost'
    {
        File ScriptFiles
        {
            SourcePath = '\\montel.local\netlogon\'
            DestinationPath = 'c:\scripts'
            Ensure = "Present"
            Type = "Directory"
            Recurse = $true
        }
    }
}