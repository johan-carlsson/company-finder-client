# Company::Finder::Client
A simple client to company-finder-server.
A CLI is also provided.

## Installation
Change COMPANY_SERVER_URL in config.rb
    
Install gem:
    bundle install
    rake install
    
## Usage

    require 'company/finder/client'
    include Company::Finder
    Client.find_company_by_name("A company name")

## CLI Usage

    bin/client A company name

## Contributing

1. Fork it ( http://github.com/<my-github-username>/company-finder-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODOs
* Prevent "rake spec" to run integration specs 
