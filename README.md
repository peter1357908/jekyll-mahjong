# jekyll-mahjong
Jekyll plugin for converting Riichi mahjong text notation into SVG images.

See [here](https://peterish.com/riichi-docs/jekyll-mahjong-plugin/) for usage notes and demo.

# Installation

First, add `gem "jekyll-mahjong` to the `:jekyll_plugins` group in your `Gemfile` and run `bundle install`.

```ruby
group :jekyll_plugins do
  gem "jekyll-mahjong"
end
```

Then, you need to ensure that Jekyll sees the stylesheet `/_sass/mahjong.scss`. For many Jekyll themes, this just means adding the following line to your site source's `/assets/css/main.scss`:

```
@import "mahjong";
```

After installing the plugin and building your site once, you'll find `/assets/tiles/*.svg` and `/_sass/mahjong.scss` in your site's source directory. If you want, you can add them to your `.gitignore`. If you already have those files in your source directory, `jekyll-mahjong` won't overwrite them unless you specifically enable overwriting (see next section).

# Customization

All styling is done through `/_sass/mahjong.scss`; you can modify it to adjust parameters like the height of tiles, space between tile groups, etc.

Similarly, you can replace the `/assets/tiles/*.svg` files with your own tile SVGs; just make sure that you follow the existing filenames.

Finally, if you want `jekyll-mahjong` to overwrite those files with the built-in version every time you build your site (e.g., for updating the built-in version)
In your `_config.yml`, you can add the following lines:

```yml
jekyll-mahjong:
  overwrite_SCSS: true # default: false
  overwrite_tiles: true # default: false
```

# Usage and Demo

See [here](https://peterish.com/riichi-docs/jekyll-mahjong-plugin/).

# Credits

## Code Author
[Peter Gao](peterish.com)

## Uzaku Tile SVGs
Face-up Tile SVGs are originally from this [Font](https://www.reddit.com/r/Mahjong/comments/qk7dca/tiles_svg_mahjong_color_font_based_on_tile/?utm_source=share&utm_medium=web2x&context=3). I ripped and reorganized the SVGs.
