$:.push File.expand_path("../lib", __FILE__)
require "sinatra/xsendfile/version"

Gem::Specification.new do |s|
  s.name = %q{sinatra-xsendfile}
  s.version = Sinatra::Xsendfile::VERSION

  s.authors = ["Vasily Polovnyov"]
  s.date = %q{2010-12-18}
  s.summary = s.description = %q{X-SendFile helper for Sinatra}
  s.email = %q{vasily@polovnyov.ru}
  s.homepage = %q{http://github.com/vast/sinatra-xsendfile}

  s.require_paths = ["lib"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "LICENSE",
    "README.md",
    "Rakefile",
    "lib/sinatra/xsendfile/version.rb",
    "lib/sinatra/xsendfile.rb",
    "test/sinatra_app.rb",
    "test/sinatra_xsendfile_test.rb"
  ]
  s.test_files = [
    "test/sinatra_xsendfile_test.rb",
    "test/sinatra_app.rb"
  ]

  s.add_runtime_dependency(%q<sinatra>, [">= 0.9.1"])
  s.add_development_dependency(%q<rack-test>, [">= 0.3.0"])
end

