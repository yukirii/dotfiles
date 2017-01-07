execute "Install Monaco for Powerline" do
  command <<-EOF
    wget #{node[:monaco_for_powerline][:url]} -O '/tmp/#{node[:monaco_for_powerline][:filename]}'
    mv '/tmp/#{node[:monaco_for_powerline][:filename]}' /Library/Fonts
EOF
  not_if 'test -e /Library/Fonts/Monaco\ for\ Powerline.otf'
end
