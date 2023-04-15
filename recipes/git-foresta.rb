directory "#{ENV['HOME']}/bin" do
  action :create
end

URL = "https://github.com/takaaki-kasai/git-foresta/raw/master/git-foresta"

execute "Install git-foresta" do
  command <<-EOF
    curl -L #{URL} -o #{ENV['HOME']}/bin/git-foresta
    chmod +x ~/bin/git-foresta
  EOF
  not_if "test -e #{ENV['HOME']}/bin/git-foresta"
end
