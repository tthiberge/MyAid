//= link_tree ../images
//= link_directory ../stylesheets .css
//= link_tree ../builds

{
  "background_color": "white",
  "description": "Le Wagon is Europe's best coding bootcamp for creative people & entrepreneurs. Learn to code in 9 weeks with our fullstack coding bootcamp.",
  "display": "fullscreen",
  "name": "Le Wagon",
  "icons": [
    <% files = Dir.entries(Rails.root.join("app/assets/images/icons/")).select {|f| !File.directory? f} %>
    <% files.each_with_index do |file, index| %>
      <% match = file.match(/.+-(?<size>\d{2,3}x\d{2,3}).png/) %>
      {
        "src": "<%= image_path "icons/#{file}" %>",
        "sizes": "<%= match && match[:size] %>",
        "type": "image/svg"
      }<%= "," unless (files.size - 1) == index %>
    <% end %>
  ]
}
