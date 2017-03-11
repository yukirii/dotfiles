git "#{ENV['HOME']}/.rbenv" do
  repository node[:rbenv][:rbenv_repo]
end

git "#{ENV['HOME']}/.rbenv/plugins/ruby-build" do
  repository node[:rbenv][:ruby_build_repo]
end
