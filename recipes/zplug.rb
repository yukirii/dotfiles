execute 'install zplug' do
  command 'curl -sL zplug.sh/installer | zsh'
  not_if "test -e $HOME/.zplug"
end
