
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fortuneteller/version'

Gem::Specification.new do |spec|
  spec.name          = 'fortuneteller'
  spec.version       = FortuneTeller::VERSION
  spec.authors       = ['Colin Sidoti']
  spec.email         = ['colin@harborplan.com']

  spec.summary       = 'A Personal Finance Simulator'
  spec.homepage      = "https://github.com/HarborEng/fortuneteller"
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
