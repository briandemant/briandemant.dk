require File.dirname(__FILE__) + '/spec_helper'
require 'sinatra/test'

describe "I Am Neato" do
  include Sinatra::Test
  
  it "should respond to /" do
    get '/'
    response.should be_ok
  end
  
  it "should return the correct headers when viewing the root" do
    get '/'
    response.headers.should == {"Content-Type"=>"text/html", "Content-Length"=>"16606"}
  end
  
  it "should respond to /about" do
    get '/about'
    response.should be_ok
  end
  
  it "should respond to /doodles" do
    get '/about'
    response.should be_ok
  end

  it "should respond to /2009/07/18/one-heroku-app-from-two-computers" do
    get '/2009/07/18/one-heroku-app-from-two-computers'
    response.should be_ok
  end 
  
  it "should be css in the headers when getting css" do
    get '/styles.css'
    response.headers["Content-Type"] == 'text/css'
  end
  
  it "should respond to /style.css" do
    get '/styles.css'
    response.should be_ok
  end
  
  it "should return 404 when page cannot be found" do
    get '/404'
    response.status.should == 404
  end

end