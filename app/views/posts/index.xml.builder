<posts>
	<% @posts.each do |post| %>
	<post>
		<title><%= post.title %></title>
		<body><%= post.text %></body>
	</post>
	<% end %>
</posts>

