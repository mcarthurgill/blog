get '/posts' do 
	erb :"posts/create_post"
end

get '/posts/:id' do
	@post = Post.find_by_id(params[:id])
	erb :"posts/post"
end

post '/posts' do
	@post = Post.new( author: params[:post][:author], 
									 title: params[:post][:title],
									 body: params[:post][:text_area])
	if @post.save
		redirect "/posts/#{@post.id}"
	else
		redirect "/posts"
	end
end