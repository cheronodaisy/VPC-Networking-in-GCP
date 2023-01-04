#!/bin/bash

#jepchumbadaisy96@gmail.com

gcloud compute networks subnets list --network default

gcloud compute routes list --filter="network=default AND priority=1000"

gcloud compute firewall-rules list

gcloud compute firewall-rules delete default-allow-icmp

gcloud compute firewall-rules delete default-allow-internal ##is allow-internal same as allow-custom?

gcloud compute firewall-rules delete default-allow-rdp

gcloud compute firewall-rules delete default-allow-ssh

gcloud compute networks delete default

gcloud compute networks create local ##local is mynetwork in actual code

###start another lab and check for allow-custom in the firewall rules for the default network before deleting. Is it same as internal? coz i need its port protocol
gcloud compute firewall-rules create mynetwork-allow-internal --network mynetwork --allow=tcp:0-65535, udp:0-65535, icmp --source-ranges="0.0.0.0/0" --direction INGRESS

gcloud compute firewall-rules create local-allow-ssh --network local --allow=tcp:22 --source-ranges="0.0.0.0/0" --direction INGRESS

gcloud compute firewall-rules create local-allow-rdp --network local --allow=tcp:3389 --source-ranges="0.0.0.0/0" --direction INGRESS

gcloud compute firewall-rules create local-allow-https --network local --allow=tcp:443 --source-ranges="0.0.0.0/0" --direction INGRESS

gcloud compute firewall-rules create local-allow-http --network local --allow=tcp:80 --source-ranges="0.0.0.0/0" --direction INGRESS

gcloud compute instances create mynet-us-vm --zone us-south1-a --machine-type e2-micro

gcloud compute instances create mynet-eu-vm --zone europe-central2-a --machine-type e2-micro

gcloud config set account $DEVSHELL_PROJECT_ID

gcloud compute ssh --project qwiklabs-gcp-03-95e97365abfa --zone us-south1-a mynet-us-vm

ping -c 3 10.186.0.2

ping -c 3 34.116.155.24

exit

gcloud compute firewall-rules delete mynetwork-allow-icmp 

gcloud compute ssh --project qwiklabs-gcp-03-95e97365abfa --zone us-south1-a mynet-us-vm

ping -c 3 10.186.0.2

ping -c 3 34.116.155.24

exit

gcloud compute firewall-rules delete mynetwork-allow-internal 

gcloud compute ssh --project qwiklabs-gcp-03-95e97365abfa --zone us-south1-a mynet-us-vm

ping -c 3 10.186.0.2
exit 
 
gcloud compute firewall-rules delete mynetwork-allow-ssh

gcloud compute ssh --project qwiklabs-gcp-03-95e97365abfa --zone us-us-south1-a mynet-us-vm

