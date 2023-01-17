job "traefik" {
  datacenters = ["dc1"]
  type        = "service"

  group "traefik" {
    count = 1

    network {
      port  "http"{
         static = 80
      }
      port  "admin"{
         static = 8080
      }
    }

    service {
      name = "traefik-http"
      provider = "nomad"
      port = "http"
    }

    task "server" {
      driver = "docker"
      config {
        image = "traefik"
        network_mode = "host"
        ports = ["admin", "http"]
        args = [
          "--api.dashboard=true",
          "--api.insecure=true", ### For Test only, please do not use that in production
          "--entrypoints.web.address=:80",
          "--entrypoints.traefik.address=:8080",
          "--providers.nomad=true",
          "--providers.nomad.endpoint.address=http://10.10.0.2:4646" ### IP to your nomad server 
        ]
      }
    }
  }
}
