# Generate .md versions of blog posts for AI agents
# Inspired by https://dri.es/the-third-audience

module Jekyll
  class MarkdownPage < Page
    def initialize(site, base, post)
      @site = site
      @base = base
      @dir = ""
      @name = "#{post.data['slug'] || post.basename_without_ext}.md"

      self.process(@name)
      self.content = post.content
      self.data = {
        "layout" => nil,
        "sitemap" => false
      }
    end
  end

  class MarkdownGenerator < Generator
    safe true
    priority :low

    def generate(site)
      site.posts.docs.each do |post|
        # Skip posts marked as excluded
        next if post.data['exclude']

        site.pages << MarkdownPage.new(site, site.source, post)
      end
    end
  end
end
