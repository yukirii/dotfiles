# Install tmux
package 'tmux' do
  user 'root' unless node[:platform] == "darwin"
  action :install
end

link "#{ENV['HOME']}/.tmux.conf" do
  to "#{ENV['HOME']}/.dotfiles/conf/tmux.conf"
end

# Install tpm
directory "#{ENV['HOME']}/.tmux/plugins"

git "#{ENV['HOME']}/.tmux/plugins/tpm" do
  repository "https://github.com/tmux-plugins/tpm.git"
end

# Install powerline-status
execute 'Install powerline-status' do
  command 'pip install powerline-status'
  not_if 'pip list | grep powerline-status'
end
