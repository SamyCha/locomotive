index.setSettings({
  searchableAttributes: [
    'brand',
    'name',
    'category',
    'color',
    'size'
    'unordered(description)',
  ],
  customRanking: ['desc(popularity)'],
});

