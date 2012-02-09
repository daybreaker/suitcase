Suitcase
========

Ruby library that utilizes the EAN (Expedia.com) API for locating available hotels (and maybe rental cars and flights someday, too).

Installation
------------

Install the gem: `gem install suitcase`. Or, to get the latest bleeding edge add this to your project's Gemfile: `gem 'suitcase', :git => "http://github.com/thoughtfusion/suitcase.git"`.

Usage
-----

First, configure the library:

      Suitcase::Configuration.hotel_api_key = "..." # set the Hotel API key from developer.ean.com
      Suitcase::Configuration.hotel_cid = "..." # set the CID from developer.ean.com
      Suitcase::Configuration.cache = Hash.new # set the caching mechanism (see below)

Find nearby hotels:

      hotels = Suitcase::Hotel.find(:location => 'Boston, MA', :results => 10) # Returns 10 closest hotels to Boston, MA
      room = hotels.first.rooms(arrival: "2/19/2012", departure: "2/26/2012", rooms: [{ children: 1, ages: [8] }, { children: 1, ages: [12] }] # Check the availability of two rooms at that hotel with 1 child in each room of ages 8 and 9
      room.reserve!(info) # See wiki page "User flow" for options

### Caching

#### Requests

You can setup a cache to store all API requests that do not contain secure information (i.e. anything but booking requests). A cache needs to be able store deeply nested Hashes and have a method called [] to access them. An example of setting the cache is given above. Check the `examples/hash_adapter.rb` for a trivial example of the required methods. A Redis adapter should be coming soon.


Contributing
------------
Please submit any useful pull requests through GitHub. If you find any bugs, please report them with the issue tracker! Thanks.
