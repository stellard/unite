# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'bundler' do
  watch('Gemfile')
  # Uncomment next line if Gemfile contain `gemspec' command
  watch(/^.+\.gemspec/)
end

guard 'rspec', :cli => '--backtrace', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/support/shared_examples/.+\.rb$}) { 'spec' }
  # watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$}) { 'spec' }
  watch('spec/spec_helper.rb')  { "spec" }
end

