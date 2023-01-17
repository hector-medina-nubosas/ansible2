job "nomad_api" {

    datacenters = ["dc1"]
    type = "service"

    group "nomad_api" {
        count = 1
        network {
            port "nomad_api_port" {
                to = 80
            }
        }    

        service {
            name = "nomad-api"
            provider = "nomad"
            port = "nomad_api_port"
           tags = [
               "traefik.enable=true",
               "traefik.http.routers.nomad_api.rule=Host(`nomad-stage.hectormedina.es`)",
           ]
        }

        task "nomad_api" {
            driver = "docker"
	
            config {
                image = "hectormedinanubosas/nginx-nomad:v5"
                ports = [ "nomad_api_port" ]
            }
            resources {
                cpu = 500
                memory = 256
            }
        }
    }
}