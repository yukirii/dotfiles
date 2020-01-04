execute 'install zplug' do
  command 'curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh'
  not_if "test -e $HOME/.zplug"
end

link "#{ENV['HOME']}/.zshrc.d/zplug.zsh" do
  to "#{ENV['HOME']}/.dotfiles/conf/zshrc.d/zplug.zsh"
end