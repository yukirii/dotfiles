node[:dotfiles].each do |file|
  link "#{ENV['HOME']}/.#{file}" do
    to "#{ENV['HOME']}/.dotfiles/conf/#{file}"
    action :create
  end
end
