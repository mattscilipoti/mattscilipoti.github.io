class Blog < Thor

  desc "start",  "Starts a server on port:4000, automatically refreshes as site is changed"
  method_options :auto_refresh => true
  def server
    auto_refresh = options[:auto]
    cmd = 'jekyll --pygments --server'
    cmd += ' --auto' if auto_refresh
    exec cmd
  end

end