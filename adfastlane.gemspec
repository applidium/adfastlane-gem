
Gem::Specification.new do |s|
  s.name        = 'adfastlane'
  s.version     = '1.0.1'
  s.executables << 'adfastlane'
  s.date        = '2017-09-27'
  s.summary     = "Fastlane wrapper for FABERNOVEL TECHNOLOGIES"
  s.description = "Fastlane wrapper for FABERNOVEL TECHNOLOGIES"
  s.authors     = ["Nicolas Braun"]
  s.email       = 'braunico@gmail.com'
  # use `git ls-files -coz -x *.gem` for development
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.homepage    = 'http://rubygems.org/gems/adfastlane'
  s.license     = 'MIT'
  s.add_dependency 'colored', '~> 1.2'
  s.add_dependency 'fastlane', '~> 2.59'
end
