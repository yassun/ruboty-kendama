module Ruboty
  module Kendama
    module Actions
      class Kendama < Ruboty::Actions::Base
        YOUTUBE_API_URL = 'http://gdata.youtube.com/feeds/api/videos'

        def initialize
          @trick = trick
        end

        def get(message)
          if url = parse(response)
            message.reply(@trick + "\n" + url)
          end
        end

        private

        def response
          connection.get do |req|
            req.params['alt'] = 'json'
            req.params['q']  = "けん玉 #{@trick}"
          end.body
        end

        def connection
          Faraday.new(url: api_url) do |builder|
            builder.request :url_encoded
            builder.adapter Faraday.default_adapter
          end
        end

        def parse(response)
          videos = JSON.parse(response)['feed']['entry']
          videos.first['link'][0]['href']
        end

        def api_url
          YOUTUBE_API_URL
        end

        def trick
          yaml = File.expand_path("../../../trick.yml", __FILE__)
          YAML.load_file(yaml).sample
        end

      end
    end
  end
end
