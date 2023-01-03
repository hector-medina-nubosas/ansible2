job "ingress" {

    datacenters = ["dc1"]

    group "ingress" {
        count = 1
        network {
            port "nginx-port"{
                static = 80
                to = 80
            }
        }    

        task "nginx" {
            driver = "docker"
	
            config {
                image = "hectormedinanubosas/nginx-nomad:v4"
                ports = [ "nginx-port" ]
                network_mode = "host"
            }

            resources {
                cpu = 500
                memory = 256
            }
        }
    }
}