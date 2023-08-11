# jekyll-mahjong
Jekyll plugin for converting Riichi mahjong text notation into SVG images.

See [here](https://peterish.com/riichi-docs/jekyll-mahjong-plugin/) for usage notes and demo.

# Installation

Simply add `gem "jekyll-mahjong` to the `:jekyll_plugins` group in your `Gemfile` and run `bundle install`.

```gemfile
group :jekyll_plugins do
  gem "jekyll-mahjong"
end
```

# Configuration (optional)

In your `_config.yml`, you can optionally specify each tile's display size like this:

```yml
jekyll-mahjong:
  tile-size: "2" # default: "2"
```

The unit is `em` (i.e., with respect to the font size).

# Usage and Demo

See [here](https://peterish.com/riichi-docs/jekyll-mahjong-plugin/).
