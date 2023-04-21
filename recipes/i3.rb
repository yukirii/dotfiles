directory "#{ENV['HOME']}/.config/i3"

link "#{ENV['HOME']}/.config/i3/config" do
  to "#{ENV['HOME']}/.dotfiles/conf/i3/config"
end

directory "#{ENV['HOME']}/.config/i3blocks"

link "#{ENV['HOME']}/.config/i3blocks/config" do
  to "#{ENV['HOME']}/.dotfiles/conf/i3blocks/config"
end

git "#{ENV['HOME']}/.config/i3blocks/i3blocks-contrib" do
  repository "https://github.com/vivien/i3blocks-contrib.git"
end
