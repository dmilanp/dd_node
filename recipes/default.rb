
apt_update "update packages" do
    action  :update
end

%w{zsh tree}.each do |pkg|
    apt_package pkg
end

%w{vagrant root}.each do |usr|
    bash "zsh default shell for #{usr}" do
        code <<-EOF
        sed -i '/^#{usr}/s_/bin/bash_/usr/bin/zsh_' /etc/passwd
        su #{usr} -c 'wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh'
        EOF
    end
end

bash "zsh theme for vagrant and root" do
    code "sed -i 's/robbyrussell/sonicradish/' /root/.zshrc && \
          sed -i 's/robbyrussell/sonicradish/' /home/vagrant/.zshrc"
end


