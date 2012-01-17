# -*- encoding : utf-8 -*-
begin
  require 'ruby-debug'
  puts "** USING THE RUBY DEBUGGER **"
rescue LoadError
  puts "!!! RUBY DEBUGGER NOT INSTALLED !!!"
end
