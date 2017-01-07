execute 'brew install neovim' do
  command 'brew install neovim/neovim/neovim'
  not_if 'brew list | grep neovim'
end

directory "#{ENV['HOME']}/.config/nvim" do
  not_if "test -e #{ENV['HOME']}/.config/nvim"
end

link "#{ENV['HOME']}/.config/nvim/init.vim" do
  to "#{ENV['HOME']}/.dotfiles/conf/config/nvim/init.vim"
  action :create
end
