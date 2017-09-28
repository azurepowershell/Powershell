Configuration LAB {

    Node $AllNodes.Nodename {
        
        $Node.features.foreach({
            WindowsFeature $_ {
                Name = $_
                Ensure = "Present"
            }
        })
            
        Service RemoteRegistry {
            Name = "RemoteRegistry"
            StartupType = "Automatic"
            State = "Running"
        }
    }#Node
}#Configuration
