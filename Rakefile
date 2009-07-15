require 'rubygems'
require 'rake/testtask'
require 'rake/gempackagetask'
require 'rubygems/specification'

GEM = "sinatra-xsendfile"
GEM_VERSION = "0.1.1"
AUTHOR = "Vasily Polovnyov"
EMAIL = "vasily@polovnyov.ru"
HOMEPAGE = "http://github.com/vast/sinatra-xsendfile"
SUMMARY = "X-SendFile helpers for Sinatra"

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.has_rdoc = false
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE

  s.add_dependency 'sinatra', '>=0.9.1'
  s.add_dependency 'rack', '>=0.9.1'

  s.add_development_dependency 'rack-test', '>=0.3.0'

  s.files = ["LICENSE", "README.md", "Rakefile"] + Dir.glob('{lib,test}/**/*')
end

task :default => :test

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end