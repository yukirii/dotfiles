execute 'Install pip' do
  command 'sudo easy_install pip'
  not_if 'which pip'
end

execute 'Install powerline-status' do
  command 'pip install powerline-status --user'
  not_if 'pip list | grep powerline-status'
end
