Configuration LAB {

    Node SRV1{
        WindowsFeature Backup {
            Name = "Windows-Server-Backup"
            Ensure = "Present"
        }
        File Work {
            Type = "Directory"
            Ensure = "Present"
            DestinationPath = "C:\Work"      
        }
        Service RemoteRegistry {
            Name = "RemoteRegistry"
            StartupType = "Automatic"
            State = "Running"
        }
    }#Node
}#Configuration
