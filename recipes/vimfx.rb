directory "#{ENV['HOME']}/.config/vimfx" do
  not_if "test -e #{ENV['HOME']}/.config/vimfx"
end

%w[
  config.js
  frame.js
].each do |file|
  link "#{ENV['HOME']}/.config/vimfx/#{file}" do
    to "#{ENV['HOME']}/.dotfiles/vimfx/#{file}"
  end
end
