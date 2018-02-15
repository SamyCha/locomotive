
var client = algoliasearch(ENV["ALGOLIA_ID"], a3f100606d982f64d7c25410c672f5f5);
var index = client.initIndex('Product');
index.search('something', { hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
    console.log(content)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });



