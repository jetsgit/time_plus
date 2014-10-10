require File.expand_path('../lib/time_plus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jerrold Thompson"]
  gem.email         = ["jerrold.r.thompson@gmail.com"]
  gem.description   = %q{Increment Time}
  gem.summary       = %q{Add minutes to time and retururn 12 hr time}
  gem.homepage      = "https://github.com/jetsgit/time_plus"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "time_plus"
  gem.require_paths = ["lib"]
  gem.version       = TimePlus::VERSION
end

