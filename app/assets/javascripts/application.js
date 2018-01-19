//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery-ui
//= require rails-timeago-all
//= require toastr
//= require underscore
//= require gmaps/google
//= require algolia/v3/algoliasearch.min

// `yarn add instantsearch.js`
const instantsearch = require('instantsearch.js');

//= require ./jquery.jTinder.js
//= require ./jquery.transform2d.js
//= require ./main.js
//= require ./jquery.min.js

//= require ./sticky-kit.js
//= require ./jquery.raty.js
//= require ./cable.js
//= require ./autocomplete.js


var client = algoliasearch(ENV["ALGOLIA_ID"], ENV["ALGOLIA_ADMIN_KEY"]);
var index = client.initIndex('Product');
index.search('something', { hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
    console.log(content)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });


var search = instantsearch({
  appId: ENV["ALGOLIA_ID"],
  apiKey: ENV["ALGOLIA_SEARCH_KEY"], // search only API key, no ADMIN key
  indexName: 'Product',
  urlSync: true
});


search.addWidget(
  instantsearch.widgets.searchBox({
    container: '#search-input',
    placeholder: 'Rechercher un article',
    poweredBy: true
  })
);

search.addWidget(
  instantsearch.widgets.hits({
    container: '#hits',
    hitsPerPage: 10,
    templates: {
      item: getTemplate('hit'),
      empty: getTemplate('no-results')
    }
  })
);

search.start();



toastr.options = {

 "positionClass": "toast-bottom-right"

 }
