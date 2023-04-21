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
