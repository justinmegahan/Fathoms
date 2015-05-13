var zips = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('zip'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch: '../data/zips.json'
});

var counties = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('county'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch: '../data/counties.json'
});

var cities = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('city'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch: '../data/cities.json'
});

var schools = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('school'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch: '../data/schools.json'
});

var districts = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('district'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  prefetch: '../data/districts.json'
});
 
zips.initialize();
counties.initialize();
cities.initialize();
schools.initialize();
districts.initialize();

$('#search .typeahead').typeahead({
  highlight: true,
  minlength: 3
},
{
  name: 'schools',
  displayKey: 'school',
  source: schools.ttAdapter(),
  templates: {
    header: '<h3 class="location">Schools</h3>'
  }
},
{
  name: 'districts',
  displayKey: 'district',
  source: districts.ttAdapter(),
  templates: {
    header: '<h3 class="location">Districts</h3>'
  }
},
{
  name: 'counties',
  displayKey: 'county',
  source: counties.ttAdapter(),
  templates: {
    header: '<h3 class="location">Counties</h3>'
  }
},
{
  name: 'zips',
  displayKey: 'zip',
  source: zips.ttAdapter(),
  templates: {
    header: '<h3 class="location">Zip Codes</h3>'
  }
},
{
  name: 'cities',
  displayKey: 'city',
  source: cities.ttAdapter(),
  templates: {
    header: '<h3 class="location">Cities</h3>'
  }
});

$('#search').on('typeahead:selected', function(obj, datum, name) {
	window.location.href = "/high/" + (datum["county-url"]);
});

$('#search').on('typeahead:autocompleted', function(obj, datum, name) {   
	window.location.href = "/high/" + (datum["county-url"]);
});