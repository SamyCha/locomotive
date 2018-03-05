
var client = algoliasearch(012967GRTQ, a3f100606d982f64d7c25410c672f5f5);
var index = client.initIndex('Product');
index.search('Product', { hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
    console.log(content)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });


