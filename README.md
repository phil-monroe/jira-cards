# Setup

JIRA Cards require Ruby 1.9.3 or later and bundler to be installed

``` bash
git clone git@github.com:phil-monroe/jira-cards.git
cd jira-cards
bundle
```

Add a config.yml for convenience to look like this:

``` yaml
:jira:
  :site:            https://jira2.example.com
  :auth_type:       !ruby/sym basic
  :ssl_verify_mode: 0
  :rest_base_path:  '/rest/api/latest'
  :context_path:    ''
  :filter:          '10107'
```

# Generating cards
``` bash
./bin/gen_cards                                                                                                                                                                                                                                  
  username: |philip.monroe| YOUR_USER
  password: YOUR_PASSWORD
  endpoint: |https://jira.example.com| YOUR_ENDPOINT
  filter: |10107| YOUR_FILTER_NUMBER
```