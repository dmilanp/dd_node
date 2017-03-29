
apt_update "update packages" do
    action  :update
end

apt_package "zsh"
