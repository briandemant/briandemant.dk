require 'lib/article'
require 'lib/archive'

class ArticleGetter
  
  def initialize(path_to_articles)
    @base_path = path_to_articles
  end
  
  def article_path(article_slug = nil)
    article_slug ? File.join(@base_path, "#{article_slug}.haml") : @base_path
  end

  def files
    Dir["#{File.expand_path(@base_path)}/*.haml"]
  end

  def all
    files.map {|f| Article.new(f)}
  end
  
  def find_by_id(id)
    self[id]
  end
  
  def [](id)
    path = article_path(id.gsub('-', '_'))
    File.exist?(path) && Article.new(path)
  end

  def template_variable(text, name)
    text[/\-\s*#\s*#{name}:\s*(.+)/, 1]
  end

  def parse_date(date_string)
    date_string && Time.local(*date_string.split('-').map {|s| s.to_i})
  end
  
  def archives
    idx = 0
    archives = []
    
    all.sort.each do |a|
      my = a.published.strftime("%B %Y")
      
      if archives.length == 0 || archives[idx].month_year != my
        idx = idx.succ unless archives.length == 0
        archives[idx] = Archive.new my, a
        next
      end

      archives[idx].articles << a
    end
    archives
  end
end