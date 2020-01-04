node[:dotfiles].each do |file|
  link "#{ENV['HOME']}/.#{file}" do
    to "#{ENV['HOME']}/.dotfiles/conf/#{file}"
  end
end

directory "#{ENV['HOME']}/.zshrc.d"

%w[
  functions.zsh
  git.zsh
].each do |file|
  link "#{ENV['HOME']}/.zshrc.d/#{file}" do
    to "#{ENV['HOME']}/.dotfiles/conf/zshrc.d/#{file}"
  end
end

# macOS
if node[:platform] == "darwin"
  link "#{ENV['HOME']}/.zshrc.d/darwin.zsh" do
    to "#{ENV['HOME']}/.dotfiles/conf/zshrc.d/darwin.zsh"
  end
end

# Linux - Ubuntu
if node[:platform] == "ubuntu"
  # WSL
  link "#{ENV['HOME']}/.zshrc.d/wsl.zsh" do
    to "#{ENV['HOME']}/.dotfiles/conf/zshrc.d/wsl.zsh"
    only_if "uname -r | grep -q Microsoft"
  end
end