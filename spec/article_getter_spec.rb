require File.dirname(__FILE__) + '/spec_helper'


describe "ArticleGetter" do
  
  before(:each) do
    Article.path = 'articles'
  end
  
  it "path should return value that it was set to" do
    Article.path.should == 'articles'
  end
  
  it "files should retrun an array of file names" do
    f = Article.files[0]
    File.extname(f).should == '.haml'
  end
  
  it "all, should return an array of Article types" do
    Article.all[0].instance_of?(Article).should be_true
  end
  
  it "indexing, should return a file by name (aka ID)" do
    Article['view-first'].title.should == 'View First'
  end
  
  it "template_variable, should be able to parse 'title' out of a line up" do
    fake_article = "blah -#title: Fake Title\n\r some new shizzle"
    Article.template_variable(fake_article, 'title').should == 'Fake Title'
  end
  
end