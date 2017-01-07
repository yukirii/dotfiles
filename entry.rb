node[:recipes] = node[:recipes] || []
node[:recipes].each do |recipe|
  include_recipe "recipes/#{recipe}.rb"
end
