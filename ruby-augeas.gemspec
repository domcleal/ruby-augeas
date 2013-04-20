PKG_NAME='ruby-augeas'
GEM_NAME=PKG_NAME # we'd like 'augeas' but that makes RPM fail
PKG_VERSION='0.3.0'

SPEC = Gem::Specification.new do |s|
    s.name = GEM_NAME
    s.version = PKG_VERSION
    s.email = "augeas-devel@redhat.com"
    s.homepage = "http://augeas.net/"
    s.summary = "Ruby bindings for augeas"
    s.authors = [ "Bryan Kearney", "David Lutterkort" ]
    s.files = `git ls-files`.split("\n")
    s.autorequire = "augeas"
    s.required_ruby_version = '>= 1.8.1'
    s.extensions = "ext/augeas/extconf.rb"
    s.description = "Provides bindings for augeas."
end
