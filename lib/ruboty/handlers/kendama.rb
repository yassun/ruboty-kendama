require "ruboty/kendama/actions/kendama"

module Ruboty
  module Handlers
    class Kendama < Base
      on /kendama/, name: 'kendama', description: 'Search kendama trick from youtube.'

      def kendama(message)
        if url = search
          message.reply(url)
        end
      end

      private

      def search
        Ruboty::Kendama::Actions::Kendama.new.get
      end

    end
  end
end
