# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

get '/messages/new' do
  erb :'messages/new'
end

post '/messages' do
  @message = Message.new(
    #title: params[:title],
    content: params[:content],
    author:  params[:author],
    url: params[:url]
  )
  if @message.save
  	redirect '/messages'
  else
  	erb :'messages/new'
  end
end

get '/messages/:id' do
  @message = Message.find params[:id]
  @othermessages = Message.where(author: @message.author).where.not(id: @message.id)
  erb :'messages/show'
end