#!/bin/bash
apt update && apt upgrade -y
apt install bash-completion git nginx prometheus-node-exporter -y
ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa <<< y
git clone https://github.com/stivik20/otus_test.git
chmod +x /root/otus_test/*/*.sh
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/f/filebeat/filebeat-8.9.1-amd64.deb
dpkg -i /root/otustest/srv1/filebeat*.deb
systemctl daemon-reload
systemctl enable --now filebeat
echo -e "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then\n    . /etc/bash_completion\nfi" >> /root/.bashrc
echo -e "Host 192.168.0.*\n   StrictHostKeyChecking accept-new" >> /root/.ssh/config
exec bash --rcfile /root/.bashrc
