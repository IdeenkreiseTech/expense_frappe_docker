git_password=XXX
site_name=ema.ideendevelopers.xyz
TAG=1.0.1
cd ../
sudo docker login ghcr.io -u IdeenkreiseTech -p $git_password
sudo docker pull ghcr.io/ideenkreisetech/expense_manager_frappe/expense_manager_frappe:$TAG
sudo docker compose -f compose.yaml -f overrides/compose.noproxy.yaml -f overrides/compose.mariadb.yaml -f overrides/compose.redis.yaml down
sudo docker compose -f compose.yaml -f overrides/compose.noproxy.yaml -f overrides/compose.mariadb.yaml -f overrides/compose.redis.yaml up -d
sudo docker compose exec backend bench --site $site_name migrate
sudo docker compose restart backend