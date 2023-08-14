Gem::Specification.new do |s|
  s.name        = 'jekyll-mahjong'
  s.version     = '2.0.0'
  s.license     = 'MIT'
  s.summary     = 'Jekyll plugin to translate riichi mahjong text notation into svg images.'
  s.description = '"jekyll-mahjong" is a Jekyll plugin that offers a "mahjong" tag that will translate the text notation like "123p444s" into vector graphics of mahjong tiles. Note that you need to import the SCSS stylesheet that comes with this gem. For documentation including installation instructions and demo, please see here: https://peterish.com/riichi-docs/jekyll-mahjong-plugin/.'
  s.authors     = ['Peter Gao']
  s.email       = 'peter1357908@hotmail.com'
  s.files       = Dir['lib/*.rb'] + Dir['assets/tiles/*.svg'] + Dir['_sass/*.scss'] 
  s.homepage    = 'https://peterish.com/riichi-docs/jekyll-mahjong-plugin/'
  s.metadata    = { 'source_code_uri' => 'https://github.com/peter1357908/jekyll-mahjong' }
end