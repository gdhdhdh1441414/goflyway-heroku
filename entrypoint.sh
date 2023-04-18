#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

######################################################
# Anything wrong? Contact me via telegram: @CN_SZTL. #
######################################################


mkdir "/caddybin"
cd "/caddybin"
wget -qO "caddy.tar.gz" "https://github.com/caddyserver/caddy/releases/download/v2.6.4/caddy_2.6.4_linux_amd64.tar.gz"
tar xvf "caddy.tar.gz"
rm -f "caddy.tar.gz"
chmod +x "caddy"
cd "/root"
mkdir "/wwwroot"
cd "/wwwroot"



wget -qO /usr/bin/goflyway https://raw.githubusercontent.com/362227/kod/master/web/data/goflyway
chmod +x /usr/bin/goflyway

cat <<-EOF > "/caddybin/Caddyfile"
slimehom61615php.herokuapp.com {
    reverse_proxy localhost:8100
}
EOF


goflyway -k y362227 &
cd "/caddybin"
./caddy -conf="Caddyfile"
