class Archive
  def initialize month_year, articles = []
    self.month_year = month_year
    self.articles = if articles.class == Array then articles
                    else [articles]
                    end
  end
  
  attr_accessor :month_year, :articles
  
end