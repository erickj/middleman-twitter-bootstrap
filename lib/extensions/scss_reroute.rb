##
# Middleman expecs scss files to be named "foo.css.scss" because the
# Middleman-SASS interpreter strips of the ".scss" portion to come up
# with the request path, however the Sass-Twitter-Bootstrap project
# omits the ".css" extension on their files.  Use this hook to match
# css file destinations that do NOT end in .css and add it back in.
module Middleman::Features::ScssReroute
  class << self
    def registered(app)
      app.build_reroute do |destination, request_path|
        if request_path =~ /^\/css\/(\/.*\/)?[^\.\/]+/
          [destination, request_path].map { |p| p << ".css" }
        else
          false
        end
      end
    end
    alias :included :registered
  end
end
