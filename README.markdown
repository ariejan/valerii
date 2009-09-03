Valerii converts and integer value to a short, URL-safe string. 

    Valerii.encode(1234) => "16J"

Installation
============

    $ gem sources -a http://gems.github.com
    $ sudo gem install ariejan-valerii
    
or to use in your Rails project, add to your config/environment.rb

    config.gem 'ariejan-valerii', :lib => 'valerii'

Usage
=====

    #!/usr/bin/env ruby
    
    require 'valerii'
    
    Valerii.encode(1234)            # => "16J"
    Valerii.decode("16J")           # => 1234
