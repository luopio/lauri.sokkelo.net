module Jekyll
  module HackFilters
    # punk liquid is broken and string|first does not work..
    def first_letter(input)
      input.downcase[0]
    end
  end
end

Liquid::Template.register_filter(Jekyll::HackFilters)