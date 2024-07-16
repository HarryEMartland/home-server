docker run \
--name shinobi \
--restart unless-stopped \
-v /var/opt/shinobi/config:/config:Z \
-v /var/opt/shinobi/customAutoLoad:/home/Shinobi/libs/customAutoLoad:Z \
-v /var/opt/shinobi/database:/var/lib/mysql:Z \
-v /var/opt/shinobi/videos:/home/Shinobi/videos:Z \
-v /var/opt/shinobi/plugins:/home/Shinobi/plugins:Z \
-v /dev/shm/Shinobi/streams:/dev/shm/streams:Z \
-p8080:8080 -d \
registry.gitlab.com/shinobi-systems/shinobi:dev