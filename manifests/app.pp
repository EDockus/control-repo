node 'node3' {
    notify {"***** NODE1 BLOCK *****":}
    include java::install, base
    
        class{'::tomcat':
        user  => 'tomcat',
        group => 'tomcat',
        xms   => '60m',
        xmx   => '120m'
    }
    
    tomcat::deploy { "sysfoo":
        deploy_url     => 'puppet:///modules/tomcat/sysfoo.war',
        checksum_value => 'c808ccfcedfd7434993ddd15e14d8e4a'
    }
}

node default {
    notify{"checkpoint_1" :
        message => "
        
            CHECKPOINT_1
            
            Applying Default BLOCK.
            The node has connected to the Puppet Master correctly, however, there are no definitions for it configured at this point.
            
        "    
    }
}
