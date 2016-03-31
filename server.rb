
require 'sinatra'

enable :sessions

get '/' do
  session[:count] = 0
  "<p>count: #{session[:count]}<br><a href='/form'>form</a>"
end

get '/form' do
  session[:count] += 1
  erb(:form)
end

post '/form' do
  session[:count] += 1
  html =  "<p>count: #{session[:count]}</p>"
  html += "<p>name:  #{params['name']}</p>"
  html += "<p>desc:  #{params['desc']}</p>"
end

not_found do
  "<p>count: #{session[:count]}<br><a href='/form'>form</a>"
end

