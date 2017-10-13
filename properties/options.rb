environment = "dev"
if ENV['env'] != nil then
  environment = ENV['env']
end
puts "Running in environment: " + environment

$ops = eval(File.open('properties/options.' + environment + '.prop') {|f| f.read })
