require 'optparse'
require 'colored'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: adfastlane [options]"
  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  opts.on("-u", "--update", "Update execute bundle update after fetching the remonte Gemfile") do |v|
    options[:update] = v
  end
  opts.on("-h", "--help", "Print this help") do
    puts opts
    exit
  end
end.parse!



puts "Preparing fastlane...".yellow
abort "Failed".red unless system( "fastlane prepare" )
if options[:update]
  puts "Updating dependencies...".yellow if options[:update]
  abort "Failed".red unless system("BUNDLE_GEMFILE=Gemfile_fastlane bundle update")
end
cmd = "BUNDLE_GEMFILE=Gemfile_fastlane bundle exec fastlane "
ARGV.each do |current|
  if current.include? ":" # that's a key/value we need to check if the value contains spaces
    key, value = current.split(":", 2)
    value = "\"#{value}\"" if value.include? " "
    cmd << key
    cmd << ":"
    cmd << value
  else
    cmd << current
  end
  cmd << " "
end
cmd << "--verbose" if options[:verbose]
puts "Running command #{cmd}".yellow
abort "Failed".red unless system( "#{cmd}")