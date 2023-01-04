# VPC-Networking-in-GCP
Google Cloud Virtual Private Cloud (VPC) allows for networking in Compute Engine virtual machine (VM) instances, Kubernetes Engine containers, and App Engine flexible environment.
This is bash script for deleting firewall rules and the default VPC network.
It then creates an auto mode VPC network with Firewall rules.
It creates two virtual machine instances with specific values and properties in two regions.
It checks for connectivity to allow ingress SSH and ICMP traffic from within the network (internal IP) and outside that network (external IP).
