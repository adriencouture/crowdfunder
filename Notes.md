Projects > index.html.erb

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
