module JekyllMahjong
  class MahjongGenerator < Jekyll::Generator
    # Find and copy(/update) all the required files to the built site.
    # only runs once per build (otherwise infinite loop during re-building if
    # file overwrite is enabled)
    def generate(site)
      if @has_run
        return
      end

      gem_path = Gem::Specification.find_by_name('jekyll-mahjong').gem_dir

      # Copy SCSS files as necessary
      scss_relative_path = '/_sass/'
      scss_files_path = File.join(gem_path, scss_relative_path, '*.scss')
      copy_as_necessary(
        site,
        Dir.glob(scss_files_path),
        scss_relative_path,
        false,
        site.config.dig('jekyll-mahjong', 'overwrite_SCSS')
      )

      # Copy and mark as static SVG files as necessary
      tiles_relative_path = '/assets/tiles/'
      svg_files_path = File.join(gem_path, tiles_relative_path, '*.svg')
      copy_as_necessary(
        site,
        Dir.glob(svg_files_path),
        tiles_relative_path,
        true,
        site.config.dig('jekyll-mahjong', 'overwrite_tiles')
      )

      @has_run = true
    end

    # given an array of files, check if they exist in the corresponding
    # directory of the site's source. If they don't exist or if overwrite is
    # specified, copy them to the site's source. If the files are static
    # and didn't exist before, mark them as static.
    def copy_as_necessary(site, filenames, relative_directory, is_static, overwrite)
      # Create the corresponding directory in site source as necessary
      site_source_directory = File.join(site.source, relative_directory)
      FileUtils.mkdir_p(site_source_directory)

      filenames.each do |filename|
        basename = File.basename(filename)
        site_source_filename = File.join(site_source_directory, basename)
        
        if !File.exist?(site_source_filename)
          FileUtils.cp(filename, site_source_filename)
          # IMPORTANT: mark to be included in the built _site
          # lifesaver: https://stackoverflow.com/a/19890768/21452015
          # documentation: https://www.rubydoc.info/gems/jekyll/Jekyll%2FStaticFile:initialize
          if is_static
            site.static_files << Jekyll::StaticFile.new(site, site.source, relative_directory, basename)
          end
        elsif overwrite
          FileUtils.cp(filename, site_source_filename)
        end

      end
    end
  end
end