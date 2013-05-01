class update_sources {
    exec { "update sources":
        command => "sudo apt-get update",
        path => "/bin:/usr/bin"
    }
}
