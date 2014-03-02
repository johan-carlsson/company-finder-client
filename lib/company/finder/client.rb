require "company/finder/client/version"
require "rest-client"
require "nokogiri"

module Company
  module Finder
    module Client
      def self.find_company_by_name(name)
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

      def self.url
        SERVER_URL+"/find"
      end

      def self.parse(response)
       xml=Nokogiri::XML(response)
       xml.xpath("//identity").text
      end

      def self.parse_error(response)
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
