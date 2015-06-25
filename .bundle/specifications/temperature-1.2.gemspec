# -*- encoding: utf-8 -*-
# stub: temperature 1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "temperature"
  s.version = "1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sean Dague"]
  s.date = "2010-11-01"
  s.description = "Temperature makes it easy to deal with temperatures in Ruby, but\nadding mixin methods to numbers and strings.  \n\nThis was inspired by using Ruby to manipulate data from my home\nweather station, and wanting it to keep track of the units for me so\nthat I didn't have to think about that in code."
  s.email = ["sean@dague.net"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.homepage = "http://github.com/sdague/temperature.rb"
  s.post_install_message = "PostInstall.txt"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.rubyforge_project = "sdaguegems"
  s.rubygems_version = "2.4.3"
  s.summary = "Temperature makes it easy to deal with temperatures in Ruby, but adding mixin methods to numbers and strings"

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.3"])
      s.add_development_dependency(%q<gemcutter>, [">= 0.3.0"])
      s.add_development_dependency(%q<hoe>, [">= 2.5.0"])
    else
      s.add_dependency(%q<rubyforge>, [">= 2.0.3"])
      s.add_dependency(%q<gemcutter>, [">= 0.3.0"])
      s.add_dependency(%q<hoe>, [">= 2.5.0"])
    end
  else
    s.add_dependency(%q<rubyforge>, [">= 2.0.3"])
    s.add_dependency(%q<gemcutter>, [">= 0.3.0"])
    s.add_dependency(%q<hoe>, [">= 2.5.0"])
  end
end
