if node[:platform] == "darwin"
  package 'neovim/neovim/neovim' do
    action :install
  end
else
  package 'neovim' do
    user 'root'
    action :install
  end
end

directory "#{ENV['HOME']}/.config/nvim" do
  not_if "test -e #{ENV['HOME']}/.config/nvim"
end

## configs
%w[
  init.vim
  dein.toml
  dein_lazy.toml
].each do |file|
  link "#{ENV['HOME']}/.config/nvim/#{file}" do
    to "#{ENV['HOME']}/.dotfiles/nvim/#{file}"
  end
end

## Shougo/dein.vim
directory "#{ENV['HOME']}/.vim/bundles"

URL = "https://raw.githubusercontent.com/Shougo/dein-installer.vim/main/installer.sh"
execute "Install dein.vim" do
  command <<-EOF
    curl #{URL} -o #{ENV['HOME']}/.vim/bundles/dein-installer.sh
    sh #{ENV['HOME']}/.vim/bundles/dein-installer.sh #{ENV['HOME']}/.vim/bundles
  EOF
  not_if "test -e #{ENV['HOME']}/.vim/bundles/repos/github.com/Shougo/dein.vim"
end
