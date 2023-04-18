#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

######################################################
# Anything wrong? Contact me via telegram: @CN_SZTL. #
######################################################


wget -qO /usr/bin/goflyway https://raw.githubusercontent.com/362227/kod/master/web/data/goflyway
chmod +x /usr/bin/goflyway

cat <<-EOF > "/caddybin/Caddyfile"
http://0.0.0.0:8100
{
  root /wwwroot
  index index.html index.txt
  timeouts none
  proxy  localhost:8100 {
    websocket
    header_upstream -Origin
  }
}
EOF


goflyway -k y362227 &
cd "/caddybin"
./caddy -conf="Caddyfile"
