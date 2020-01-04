directory "#{ENV['HOME']}/.config/peco" do
  not_if "test -e #{ENV['HOME']}/.config/peco"
end

package 'peco' do
  user 'root' unless node[:platform] == "darwin"
  action :install
end

link "#{ENV['HOME']}/.config/peco/config.json" do
  to "#{ENV['HOME']}/.dotfiles/peco/config.json"
end