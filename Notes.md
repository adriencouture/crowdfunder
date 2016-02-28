Projects > index.html.erb

<%= link_to 'Sign Up', new_user_path %>


<% if @projects.any? %>
<ul>
<% @projects.each do |project| %>
    <li class="projects">
      <%= link_to project.title, project_path(project) %>
    </li>
  <% end %>
  </ul>
<% else %>
<h2>No projects yet</h2>
<% end %>

_project.html.erb

<!-- keeps the description to 60 characters or less -->
<p><%= truncate(project.description, length: 60) %></p>

SessionsController.rb

def create
  user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to projects_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
end

def destroy
  session[:user_id] = nil
  redirect_to projects_path, notice: "logged out!"
end

Sessions
new.html.erb

<%= form_tag sessions_new_path do %>
  <div class="field">
    <%= label_tag :email %><br/>
    <%= text_field_tag :email, params[:email] %>
  </div>
  <div class="field">
    <%= label_tag :password %><br/>
    <%= password_field_tag :password %>
  </div>
  <div class="actions">
    <%= submit_tag "Log in" %>
  </div>
<% end %>
