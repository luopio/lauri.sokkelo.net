# Title: Jekyll Exif tag
# Authors: Lauri Kainulainen @laurikainulaine
#
# Description: Quick hack to extract Exif information from photos. Didn't really work with my
#               FujiFilm cam, so left to rot..
#

require 'exifr'

module Jekyll

  class Exif < Liquid::Tag

    def render(context)

      filename, exif_variable = @markup.split(' ', 2)
      site = context.registers[:site]

      EXIFR::JPEG.new(File.join(site.source, filename)).send(exif_variable).to_s
    end
  end
end

Liquid::Template.register_tag('exif', Jekyll::Exif)