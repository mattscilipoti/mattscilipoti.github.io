class Blog < Thor

  desc "starts a server",  "Starts a server on port:4000, automatically refreshes as site is changed"
  def server
    cmd = 'jekyll --pygments --server --auto --safe --rdiscount --lsi'
    exec cmd
  end

  desc "watches & generates",  "Watches the site, automatically refreshes as site is changed"
  def watch
    cmd = 'jekyll --pygments --auto --rdiscount'
    exec cmd
  end

end