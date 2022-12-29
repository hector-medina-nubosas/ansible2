acl {
  enabled = true
}

data_dir  = "/var/lib/nomad"

bind_addr = "0.0.0.0" # the default

addresses {
  # Internal RPC communication between client agents and servers, and for inter-server traffic.
  rpc   = "10.10.0.2"   # Exposed only to other cluster members 
  # Serf propagation information between servers.
  serf  = "10.10.0.2"   # Exposed only to other cluster members 
}

advertise {
  http  = "10.10.0.2"
  # Internal RPC communication between client agents and servers, and for inter-server traffic.
  rpc   = "10.10.0.2"   # Exposed only to other cluster members
  # Serf propagation information between servers.
  serf  = "10.10.0.2"   # Exposed only to other cluster members
}


server {
  enabled          = true
  bootstrap_expect = 1
  # Encrypt gossip communication
  encrypt          = "m6+hrtQJTVPU/gVnv4a4dg43AoxCqo4eYyEd1Po65Ro="
}

client {
  enabled   = true
  memory_total_mb  = 1000
  cpu_total_compute = 1294
}

tls {
  http = true
  key_file = "/etc/nomad.d/privkey.pem"
  cert_file = "/etc/nomad.d/fullchain.pem"
  verify_server_hostname = true
}