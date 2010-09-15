class Blog < Thor

  desc "starts a server",  "Starts a server on port:4000, automatically refreshes as site is changed"
  def server
    cmd = 'jekyll --pygments --server --auto'
    exec cmd
  end

end