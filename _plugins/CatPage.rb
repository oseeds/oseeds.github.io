module Jekyll
  # This generates a Page showing all blog posts for a specific tag
  class CatPage < Page
    def initialize(site, base, dir, cat)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      process(@name)
      read_yaml(File.join(base, '_layouts'), 'catpage.html')
      data['cat'] = cat

      data['title'] = cat.dup.tr! '_', ' '
      data['filterByCat'] = "#{cat}"
    end
  end

  # This generates an Atom feed for a specific tag
  class CatAtom < Page
    def initialize(site, base, dir, cat)
      @site = site
      @base = base
      @dir = dir
      @name = "#{cat}.xml"

      process(@name)
      read_yaml(File.join(base, '_layouts'), 'atom.html')
      data['cat'] = cat

      data['title'] = "#{cat}"
      data['filterByCat'] = "#{cat}"
    end
  end

  class CatPageGenerator < Generator
    safe true

    # Generate tag page and atom feed for each tag used in the blogs
    def generate(site)
      if site.layouts.key? 'catpage'
        site.categories.keys.each do |cat|
          site.pages << CatPage.new(site, site.source, File.join('categories', cat), cat)
          site.pages << CatAtom.new(site, site.source, File.join('atom'), cat)
        end
      end
    end
  end
end