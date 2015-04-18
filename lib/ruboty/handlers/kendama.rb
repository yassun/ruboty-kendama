require "ruboty/kendama/actions/kendama"

module Ruboty
  module Handlers
    class Kendama < Base
      on /kendama kendama/, name: 'kendama', description: 'TODO: write your description'

      def kendama(message)
        Ruboty::Kendama::Actions::Kendama.new(message).call
      end
    end
  end
end
