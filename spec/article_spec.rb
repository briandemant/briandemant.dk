require File.dirname(__FILE__) + '/spec_helper'

describe "Article" do
  
  before(:each) do
    @article = Article.new('articles/view_first.haml') 
  end
  
  it "should return full path to article" do
    @article.path.should == 'articles/view_first.haml'
  end
  
  it "should return file name" do
    @article.slug.should == 'view_first'
  end
  
  it "should convert the underscores in filename to dashes" do
    @article.id.should == 'view-first'
  end
  
  it "should return title" do
    @article.title.should == 'View First'
  end
  
  it "should return published date" do
    @article.published.should == Time.parse('2009-7-5')
  end
  
  it "should return nil when updated is not set" do
    @article.updated.should be_nil
  end
  
  it "should return published when updated is nil" do
    @article.last_modified.should == @article.published
  end
  
  it "should be able to parse 'title' out of a line up" do
    @article.template_variable('title').should == 'View First'
  end
  
  it "should return a date" do
    @article.parse_date('2009-11-12').instance_of?(Time).should be_true
  end
  
  it "should be greater than 0 when article1.published is less than article2.published" do
    article1 = Article.new('articles/leela.haml')
    article2 = Article.new('articles/view_first.haml')
    
    (article1 <=> article2).should be > 0
  end
  
  it "should be equal to 0 when article1.published is equal to article2.published" do
    article1 = Article.new('articles/view_first.haml')
    article2 = Article.new('articles/view_first.haml')
    
    (article1 <=> article2).should == 0
  end
  
end