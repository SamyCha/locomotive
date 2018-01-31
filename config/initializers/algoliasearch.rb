require 'rubygems'
require 'algoliasearch'

Algolia.init application_id: '012967GRTQ',
             api_key:        '30cb1e37472e228868705e6625efc35b'
index = Algolia::Index.new("Product")
