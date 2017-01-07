git "#{ENV['HOME']}/.rbenv" do
  repository node[:rbenv_repo]
end

git "#{ENV['HOME']}/.rbenv/plugins/ruby-build" do
  repository node[:ruby_build_repo]
end
