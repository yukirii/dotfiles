node[:homebrew_packages].each do |pkg|
  execute "brew install #{pkg}" do
    command "brew install #{pkg}"
    not_if "brew list | grep #{pkg.split('/').last}"
  end
end
