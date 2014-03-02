require "company/finder/client/version"
require "rest-client"
require "nokogiri"

module Company
  module Finder
    module Client
      class << self
        def find_company_by_name(name)
          begin
            response=RestClient.get(url, {params: {name: name}})
            message=parse(response)
          rescue RestClient::ExceptionWithResponse => e
            message=parse_error(e.response)
          rescue => e 
            message="Client error: #{e}"
          end
          return message
        end

        private

        def url
          COMPANY_FINDER_SERVER_URL+"/find"
        end

        def parse(response)
          xml=Nokogiri::XML(response)
          xml.xpath("//identity").text
        end

        def parse_error(response)
          xml=Nokogiri::XML(response)
          error=xml.xpath("//error").text
          if error.empty?
            error="Unable to parse error message from client. Response: #{response}"
          end
          error
        end
      end
    end
  end
end
