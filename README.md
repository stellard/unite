# Install

**With Bundler**
```ruby
gem 'unite'
```

**Without Bundler**
```bash
gem install unite
```

# It's Science

![It's Science](http://gifrific.com/wp-content/uploads/2012/06/its-science-anchorman.gif)

Based on the algorithms developed by Gordon S. Novak, Jr. at the University of Texas, which can be found here:

  http://www.cs.utexas.edu/users/novak/units95.html


# Dimensions

Handles the following dimensions:

```ruby
[:length, :time, :temperature, :mass, :current, :substance, :luminosity, :money]
```

_Note: **Conversion** of Money is not currently supported._
 
Can use Unite::Quantity to represent values or include the functionality into your own objects.
 
Look at https://github.com/stellard/unite/blob/master/lib/unite/quantity.rb for a minum implementation
 

# Examples: (needs more info here)
 
```ruby
Unite::Quantity.init("1000*km")
Unite::Quantity.init("1000","km")
```

 Unit definitions are found here
 
 https://github.com/stellard/unite/blob/master/lib/unite/lookup/definitions.rb
 
 Specs show good examples of use. 
