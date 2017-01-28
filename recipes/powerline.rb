execute 'Install powerline-status' do
  command 'pip install powerline-status'
  not_if 'pip list | grep powerline-status'
end
