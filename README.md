# Home Server

This is how I deploy my local home services

## Redeploying

Configure podman remote
`podman system connection add shinobi tcp://localhost:1234`

SSH into the box forwarding ports for podman
`ssh -Llocalhost:1234:localhost:1234 core@192.168.1.64`

Run podman service as root. 
This is due to the user podman is run as is important. 
Running as root allows systemctl to be able to access the pods
`sudo podman system service -t 5000 tcp://localhost:1234`

