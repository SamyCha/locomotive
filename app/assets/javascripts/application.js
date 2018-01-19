//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery-ui
//= require rails-timeago-all
//= require toastr
//= require underscore
//= require gmaps/google
//= require algolia/v3/algoliasearch.min

//= require ./jquery.jTinder.js
//= require ./jquery.transform2d.js
//= require ./main.js
//= require ./jquery.min.js

//= require ./sticky-kit.js
//= require ./jquery.raty.js
//= require ./cable.js
//= require ./autocomplete.js




var client = algoliasearch(012967GRTQ, a3f100606d982f64d7c25410c672f5f5);
var index = client.initIndex('Product');
index.search('something', { hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
    console.log(content)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });






















toastr.options = {

 "positionClass": "toast-bottom-right"

 }
