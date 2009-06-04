# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wave}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jack Danger Canty"]
  s.date = %q{2009-06-03}
  s.email = %q{google-wave@jackcanty.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "lib/wave.rb",
     "lib/wave/annotation.rb",
     "lib/wave/blip.rb",
     "lib/wave/document.rb",
     "lib/wave/events.rb",
     "lib/wave/operation.rb",
     "lib/wave/participant.rb",
     "lib/wave/robot.rb",
     "lib/wave/wavelet.rb",
     "test/annotation_test.rb",
     "test/blip_test.rb",
     "test/document_test.rb",
     "test/participant_test.rb",
     "test/robot_test.rb",
     "test/test_helper.rb",
     "test/wave_test.rb",
     "test/wavelet_test.rb",
     "wave.gemspec"
  ]
  s.homepage = %q{http://github.com/JackDanger/wave}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Ruby client for the Google Wave Federation Protocol}
  s.test_files = [
    "test/annotation_test.rb",
     "test/blip_test.rb",
     "test/document_test.rb",
     "test/participant_test.rb",
     "test/robot_test.rb",
     "test/test_helper.rb",
     "test/wave_test.rb",
     "test/wavelet_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 1.0.0"])
    else
      s.add_dependency(%q<rack>, [">= 1.0.0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 1.0.0"])
  end
end
