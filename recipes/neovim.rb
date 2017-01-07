directory "#{ENV['HOME']}/.config/nvim" do
  not_if "test -e #{ENV['HOME']}/.config/nvim"
end

execute 'brew install neovim' do
  command 'brew install neovim/neovim/neovim'
  not_if 'brew list | grep neovim'
end

git "#{ENV['HOME']}/.config/nvim/bundle/dein.vim" do
  repository node[:neovim][:dein_vim_repo]
end

%w[
  init.vim
  dein.toml
  dein_lazy.toml
].each do |file|
  link "#{ENV['HOME']}/.config/nvim/#{file}" do
    to "#{ENV['HOME']}/.dotfiles/nvim/#{file}"
  end
end
