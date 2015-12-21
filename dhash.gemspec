Gem::Specification.new do |s|
  s.name        = 'dhash'
  s.version     = '1.0.0'
  s.date        = '2015-12-21'
  s.description = "Calculate the DHash of an image file"
  s.summary     = ''
  s.authors     = ["Rohan Patel"]
  s.email       = 'rohan@rohan.io'
  s.files       = ["lib/dhash.rb"]
  s.require_paths = ["lib"]
  s.homepage    =
      'https://github.com/rohanpatel2602/ruby-dhash'
  s.license       = 'MIT'
  s.add_development_dependency 'bundler'
  s.add_dependency 'rmagick'
end