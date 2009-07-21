# I got this code from artpop:
# http://github.com/artpop/hughevans.net/blob/32a6310c825bb7ce0c470cf0ef325bdb5e9491a4/lib/article.rb

# But it was originally from toolmantim:
# http://github.com/toolmantim/toolmantim/blob/972372615c534916a3a1c8ae0f01e72626ca83e0/lib/article.rb

class Article

  attr_reader :path, :template

  def initialize(file_path)
    @path = file_path
    @template = File.read(file_path)
  end

  def slug
    File.basename(self.path, '.haml')
  end
  
  def id
    slug.gsub('_', '-')
  end

  def title
    template_variable('title')
  end

  def published
    @published ||= parse_date(template_variable('published'))
  end

  def updated
    @updated ||= parse_date(template_variable('updated'))
  end

  def last_modified
    updated || published
  end

  def template_variable(name)
    self.template[/\-\s*#\s*#{name}:\s*(.+)/, 1]
  end

  def parse_date(date_string)
    date_string && Time.local(*date_string.split('-').map {|s| s.to_i})
  end
  
  def <=>(other)
    [other.published.year, other.published.month, other.published.day] <=> [self.published.year, self.published.month, self.published.day]
  end
end