require 'rubygems'
require 'sinatra'
require 'haml'
require 'time'
require 'lib/article'

Article.path = File.join(Sinatra::Application.root, 'articles')

helpers do
  def article_body(article)
    haml(article.template, :layout => false)
  end

  def article_path(article)
    "/#{article.published.strftime("%Y/%m/%d")}/#{article.id}"
  end
  
  def absoluteify_links(html)
    host = 'http://www.iamneato.com'
    path = "\\1#{host}\\2\\3"
    
    html.
      gsub(/href=(["'])(\/.*?)(["'])/, "href=#{path}").
      gsub(/src=(["'])(\/.*?)(["'])/, "src=#{path}")
  end
end

get '/' do
  @articles = Article.all.sort[0..10]
  haml :home
end

get '/:year/:month/:day/:id' do
  @article = Article[params[:id]] || raise(Sinatra::NotFound)
  @title = @article.title
  haml :article
end

get '/doodles' do
  @title = 'Doodles'
  haml :doodles
end

get '/archive' do
  @articles = Article.all.sort
  @title = 'Archive'
  haml :archive
end

get '/about' do
  @title = 'About'
  haml :about
end

get '/articles.atom' do
  @articles = Article.all.sort
  content_type 'application/atom+xml'
  haml :feed, :layout => false
end

get '/:style.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"stylesheets/#{params[:style]}"
end

not_found do
  @title = '404 - Page Not Found'
  haml :'404', :layout => false
end

module Haml::Filters::Preserve
  def render(text)
    Haml::Helpers.preserve(Haml::Helpers.html_escape(text))
  end
end