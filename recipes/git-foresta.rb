directory "#{ENV['HOME']}/bin" do
  action :create
end

URL = "https://github.com/takaaki-kasai/git-foresta/raw/master/git-foresta"

execute "Install git-foresta" do
  command <<-EOF
    wget #{URL} -O #{ENV['HOME']}/bin/git-foresta
    chmod +x ~/bin/git-foresta
  EOF
  not_if "test -e #{ENV['HOME']}/bin/git-foresta"
end
