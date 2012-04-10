require 'sinatra'
require './todo_list'

enable :sessions


commands = "<br /><br /><a href='/add'>Add</a><br />"

get '/' do
  @todo = session[:todo]
  session[:todo] = TodoList.new if @todo.nil?

  erb @todo.web_output + commands
end

get '/add' do
  "<form action='/add' method='post'>
    Item: <input type='text' name='description' />
    <input type='submit'  name='command' value='Add' />
  </form>"
end

post '/add' do
  @todo = session[:todo]
  description = params[:description]
  @todo.add(description)
  session[:todo] = @todo
  redirect to("/")
end

get '/edit'  do
  @todo = session[:todo]
  index = params[:index].to_i
  "<form action='/update' method='post'>
    Item: <input type='text' name='description' value='#{@todo.list[index - 1]}' />
    <input type='hidden' name='index' value='#{index}' />
    <input type='submit'  name='command' value='edit' />
  </form>"
end

post '/update' do
  @todo = session[:todo]
  description = params[:description]
  index = params[:index]
  @todo.edit_item(index, description)
  session[:todo] = @todo
  redirect to("/")
end

get '/check' do
  @todo = session[:todo]
  index = params[:index]
  @todo.check_off(index.to_i)
  session[:todo] = @todo
  redirect to("/")
end