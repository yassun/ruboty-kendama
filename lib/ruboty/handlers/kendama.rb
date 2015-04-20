require "ruboty/kendama/actions/kendama"

module Ruboty
  module Handlers
    class Kendama < Base
      on /kendama/, name: 'kendama', description: 'Search kendama trick from youtube.'

      def kendama(message)
        Ruboty::Kendama::Actions::Kendama.new.get(message)
      end

    end
  end
end
