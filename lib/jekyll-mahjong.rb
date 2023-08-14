require_relative 'jekyll-mahjong-generator'

module JekyllMahjong
  class MahjongTag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      @input = input.strip
    end

    def render(context)
      # do nothing if input is empty
      if @input.empty?
        return ""
      end

      # get the tile groups: "123p789s 1Z11z" => ["123p789s", "1Z11z"]
      tile_groups = @input.split(' ')

      # convert the first group
      output = svg_for_tile_group(tile_groups[0])

      # convert the remaining groups
      for tile_group in tile_groups[1..-1]
        svg_group = svg_for_tile_group(tile_group)

        # add group to the output unless the group is empty
        unless svg_group.empty?
          # add space between groups unless there is no previous group
          unless output.empty?
            output += "<span class='space-between-tile-groups' />"
          end
          output += svg_group
        end
      end

      return output
    end

    private
    def svg_for_tile_group(tile_group)
      # get the tile suit blocks: "12p78s45p" => ["12p", "78s", "45p"]
      tile_suit_blocks = tile_group.scan(/\d+[mspzxMSPZX]/)
      # ["123p", "789s"] => ["<img />", "<img />" ...]
      svg_tiles = tile_suit_blocks.flat_map { |tile_suit_block| svg_for_tile_suit_block(tile_suit_block) }

      if svg_tiles.empty?
        return ""
      end

      "<span class='mahjong-tiles'>#{svg_tiles.join}</span>"
    end

    def svg_for_tile_suit_block(tile_suit_block)
      suit = tile_suit_block[-1]
      tile_suit_block[0..-2].each_char.map { |number| svg_for_tile(number, suit) }
    end

    def svg_for_tile(number, suit)
      tile_name = "#{number}#{suit}"
      if suit == suit.upcase
        # sideways tile
        file_name = "#{number}#{suit.downcase}"
        class_name = " sideways"
      else
        # upright tile
        file_name = tile_name
        class_name = ""
      end

      "<span class='mahjong-tile-container#{class_name}'><img src='/assets/tiles/#{file_name}.svg' alt='#{tile_name}' /></span>"
    end
  end
end

Liquid::Template.register_tag('mahjong', JekyllMahjong::MahjongTag)
