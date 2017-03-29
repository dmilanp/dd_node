
apt_update "update packages" do
    action  :update
end

apt_package "zsh"

bash "zsh default shell for vagrant" do
    command <<-EOF
    sed -i '/^vagrant/s_/bin/bash_/usr/bin/zsh_' /etc/passwd
    echo 'ZSH_THEME="robbyrussell"' | tee -a /home/vagrant/.zshrc
    EOF
end
