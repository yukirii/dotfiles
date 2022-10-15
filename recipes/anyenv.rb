git "#{ENV['HOME']}/.anyenv" do
  repository "https://github.com/anyenv/anyenv.git"
  not_if "test -e #{ENV['HOME']}/.anyenv"
end

link "#{ENV['HOME']}/.zshrc.d/anyenv.zsh" do
  to "#{ENV['HOME']}/.dotfiles/conf/zshrc.d/anyenv.zsh"
end
