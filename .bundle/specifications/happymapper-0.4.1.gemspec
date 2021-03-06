# -*- encoding: utf-8 -*-
# stub: happymapper 0.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "happymapper"
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["John Nunemaker"]
  s.date = "2013-09-26"
  s.email = ["nunemaker@gmail.com"]
  s.homepage = "http://happymapper.rubyforge.org"
  s.rubyforge_project = "happymapper"
  s.rubygems_version = "2.4.3"
  s.summary = "object to xml mapping library"

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<libxml-ruby>, ["~> 2.0"])
    else
      s.add_dependency(%q<libxml-ruby>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<libxml-ruby>, ["~> 2.0"])
  end
end
