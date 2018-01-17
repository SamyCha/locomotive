var search = instantsearch({
  // Replace with your own values
  appId: '012967GRTQ',
  apiKey: 'a3f100606d982f64d7c25410c672f5f5', // search only API key, no ADMIN key
  indexName: 'instant_search',
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


search.addWidget(
  instantsearch.widgets.pagination({
    container: '#pagination'
  })
);


search.start();
