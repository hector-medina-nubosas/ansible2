data_dir  = "/var/lib/nomad"

bind_addr = "0.0.0.0"

addresses {
  http  = "127.0.0.1 10.10.0.3"
  # Internal RPC communication between client agents and servers, and for inter-server traffic.
  rpc   = "10.10.0.3"   # Exposed only to other cluster members 
}

advertise {
  http  = "10.10.0.3"
  # Internal RPC communication between client agents and servers, and for inter-server traffic.
  rpc   = "10.10.0.3"   # Exposed only to other cluster members
}

client {
  enabled   = true

  server_join {
    retry_join = ["10.10.0.2:4647"]
  }
 
}