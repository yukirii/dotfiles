directory "#{ENV['HOME']}/.dotfiles/tmp" do
  not_if "test -e #{ENV['HOME']}/.dotfiles/tmp"
  action :create
end

execute "Install iterm2-japanesque" do
  command <<-EOF
    wget #{node[:iterm2_japanesque][:url]} -O #{ENV['HOME']}/.dotfiles/tmp/Japanesque.itermcolors
    if [ -e /Applications/iTerm.app ]; then
      open #{ENV['HOME']}/.dotfiles/tmp/Japanesque.itermcolors
    fi
  EOF
  not_if "test -e #{ENV['HOME']}/.dotfiles/tmp/Japanesque.itermcolors"
end
