execute 'Install powerline-status' do
  command 'pip install --user powerline-status'
  not_if 'pip list | grep powerline-status'
end
