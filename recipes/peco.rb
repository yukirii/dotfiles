directory "#{ENV['HOME']}/.config/peco" do
  not_if "test -e #{ENV['HOME']}/.config/peco"
end

execute 'brew install peco' do
  command 'brew install peco'
  not_if 'brew list | grep peco'
end

link "#{ENV['HOME']}/.config/peco/config.json" do
  to "#{ENV['HOME']}/.dotfiles/peco/config.json"
end
