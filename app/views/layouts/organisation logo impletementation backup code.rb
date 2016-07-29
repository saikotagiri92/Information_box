#-------------------------organisation logo in header------------------
#insert after organisation switcher code
<div class="navbar-brand">
    <% if current_organisation.organisation_logo != nil %>
        <%= link_to image_tag(current_organisation.organisation_logo.logo.url(:header_logo), :class => "header-comp-logo"), organisation_show_url %>
        <%= link_to current_organisation.organisation_name, organisation_show_url, :style => "color: #ffffff; text-decoration: none;" %>
    <% else %>
        <%= link_to image_tag("logo.png", class:  "header-comp-logo" ), organisation_show_url %>
        <%= link_to current_organisation.organisation_name, organisation_show_url, :style => "color: #ffffff; text-decoration: none;" %>
    <% end %>
</div>