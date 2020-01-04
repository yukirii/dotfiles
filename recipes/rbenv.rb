git "#{ENV['HOME']}/.rbenv" do
  repository "https://github.com/sstephenson/rbenv.git"
end

git "#{ENV['HOME']}/.rbenv/plugins/ruby-build" do
  repository "https://github.com/sstephenson/ruby-build.git"
end