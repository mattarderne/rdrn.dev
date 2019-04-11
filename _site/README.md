# mattarderne.github.io

Static repo for my [personal blog](https://rdrn.dev/) created using Jekyll.

To serve locally:
```
gem install bundler jekyll
bundle exec jekyll serve
```



[_data](/_data) - photos.yml to describe pics
[_layouts/default.html](_layouts/default.html) -  setup all the areas


Basically:
[x] delete shit in _data/ unless you want photos/books
[x] some hardcoded stuff (side nav, email) in _layouts/default.html 
[x] delete everything in _posts/ (but keep a blank one as a template)
[ ] delete everything in assets except fonts/ and replace images/face.jpg if you 
[x] delete CNAME
[x] edit as appropriate in _config.yml
[x] delete/edit about.md
[ ] delete/replace favicon.ico
[x] delete if you want photos.html and books.html
[ ] delete the two hardcoded <url> entries from sitemap.xml