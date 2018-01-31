//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery-ui
//= require rails-timeago-all
//= require toastr
//= require underscore
//= require gmaps/google

//= require algolia/v3/algoliasearch.min

//= require chosen-jquery
//= require messages

//= require ./jquery.jTinder.js
//= require ./jquery.transform2d.js
//= require ./main.js
//= require ./jquery.min.js


//= require ./sticky-kit.js
//= require ./jquery.raty.js
//= require ./cable.js
//= require ./autocomplete.js

toastr.options = {

 "positionClass": "toast-bottom-right"

 }


var search = instantsearch({
  // Replace with your own values
  appId: '012967GRTQ',
  apiKey: 'Ya3f100606d982f64d7c25410c672f5f5', // search only API key, no ADMIN key
  indexName: 'Product',
  urlSync: true,
  searchParameters: {
    hitsPerPage: 10
  }
});

search.addWidget(
  instantsearch.widgets.searchBox({
    container: '#search-input'
  })
);

search.addWidget(
  instantsearch.widgets.hits({
    container: '#hits',
    templates: {
      item: document.getElementById('hit-template').innerHTML,
      empty: "We didn't find any results for the search <em>\"{{query}}\"</em>"
    }
  })
);

search.start();
