module JekyllMahjong
  class MahjongGenerator < Jekyll::Generator
    # Find and copy all the SVG tile images to the built site.
    def generate(site)
      gem_path = Gem::Specification.find_by_name('jekyll-mahjong').gem_dir
      relative_path = '/assets/tiles/'

      # Create the target directory in site source if it doesn't exist
      target_source_directory = File.join(site.source, relative_path)
      FileUtils.mkdir_p(target_source_directory)

      # Copy SVG files to the site's source assets directory if it doesn't
      # exist yet.
      svg_files_path = File.join(gem_path, relative_path, '*.svg')
      svg_files = Dir.glob(svg_files_path)
      
      svg_files.each do |svg_file|
        file_basename = File.basename(svg_file)
        file_source_path = File.join(target_source_directory, file_basename)
        unless File.exist?(file_source_path)
          FileUtils.cp(svg_file, file_source_path)
        end

        # ... and mark them to be included in the built _site
        # lifesaver: https://stackoverflow.com/a/19890768/21452015
        # documentation: https://www.rubydoc.info/gems/jekyll/Jekyll%2FStaticFile:initialize
        site.static_files << Jekyll::StaticFile.new(site, site.source, relative_path, file_basename)
      end
    end
  end
end