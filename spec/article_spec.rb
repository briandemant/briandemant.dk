require File.dirname(__FILE__) + '/spec_helper'

describe "Article" do
  
  before(:each) do
    Article.path = 'articles'
  end
  
  it "should return path to articles" do
    Article.path.should == 'articles'
  end
  
  it "should retrun all article file names" do
    f = Article.files[0]
    File.extname(f).should == '.haml'
  end
  
  it "should return all Articles" do
    Article.all[0].instance_of?(Article).should be_true
  end
  
  it "should return a file by name (aka ID) when accessing via an indexer" do
    Article['view-first'].title.should == 'View First'
  end
  
  it "should be able to parse 'title' out of a line up" do
    fake_article = "blah -#title: Fake Title\n\r some new shizzle"
    Article.template_variable(fake_article, 'title').should == 'Fake Title'
  end
  
  it "should return a date" do
    Article.parse_date('2009-11-12').instance_of?(Time).should be_true
  end
  
end