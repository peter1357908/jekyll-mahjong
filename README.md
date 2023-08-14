# jekyll-mahjong
Jekyll plugin for converting Riichi mahjong text notation into SVG images.

See [here](https://peterish.com/riichi-docs/jekyll-mahjong-plugin/) for usage notes and demo.

# Installation

Simply add `gem "jekyll-mahjong` to the `:jekyll_plugins` group in your `Gemfile` and run `bundle install`.

```ruby
group :jekyll_plugins do
  gem "jekyll-mahjong"
end
```

# Configuration (optional)

In your `_config.yml`, you can optionally configure the following behaviors:

```yml
jekyll-mahjong:
  overwrite_SCSS: true # default: false
  overwrite_tiles: true # default: false
```

The unit is `em` (i.e., with respect to the font size).

# Usage and Demo

See [here](https://peterish.com/riichi-docs/jekyll-mahjong-plugin/).

# Credits

## Code Author
[Peter Gao](peterish.com)

## Uzaku Tile SVGs
Face-up Tile SVGs originally from this [Font](https://www.reddit.com/r/Mahjong/comments/qk7dca/tiles_svg_mahjong_color_font_based_on_tile/?utm_source=share&utm_medium=web2x&context=3). I ripped and reorganized the SVGs.
