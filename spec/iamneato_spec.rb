require File.dirname(__FILE__) + '/spec_helper'

describe "I Am Neato" do
  include Rack::Test::Methods
  
  def app
    @app ||= Sinatra::Application
  end
  
  it "should respond to /" do
    get '/'
    last_response.should be_ok
  end
  
  it "should return the correct content-type when viewing the root" do
    get '/'
    last_response.headers["Content-Type"].should == "text/html"
  end
  
  it "should return content when viewing the root" do
    get '/'
    last_response.headers["Content-Length"].to_i.should > 0
  end
  
  it "should respond to /about" do
    get '/about'
    last_response.should be_ok
  end
  
  it "should respond to /doodles" do
    get '/doodles'
    last_response.should be_ok
  end
  
  it "should respond to /archive" do
    get '/archive'
    last_response.should be_ok
  end

  it "should respond to /2009/07/18/one-heroku-app-from-two-computers" do
    get '/2009/07/18/one-heroku-app-from-two-computers'
    last_response.should be_ok
  end 
  
  it "should be css in the headers when getting css" do
    get '/styles.css'
    last_response.headers["Content-Type"].should == 'text/css;charset=utf-8'
  end
  
  it "should respond to /style.css" do
    get '/styles.css'
    last_response.should be_ok
  end
  
  it "should return 404 when page cannot be found" do
    get '/404'
    last_response.status.should == 404
  end

end