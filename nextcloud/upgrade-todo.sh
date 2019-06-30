# A script to upgrade the nextcloud server to the latest version. Run this while the nextcloud container is up and running.
docker exec --user www-data nextcloud-app-server php occ background:cron
docker exec --user www-data nextcloud-app-server php occ upgrade
docker exec --user www-data nextcloud-app-server php occ db:add-missing-indices
docker exec --user www-data nextcloud-app-server php occ db:convert-filecache-bigint
