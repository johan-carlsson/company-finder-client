require 'company/finder/client'
include Company::Finder

describe Client do 
  it "should parse out identity from response xml" do
    response_xml=<<-XML
<company>
  <name>A company</name>
  <identity>123-456</identity>
</company>
    XML
    result=Client.send(:parse, response_xml)    
    result.should eql("123-456")
  end

  it "should parse error response xml" do
    response_xml=<<-XML
<company>
  <error>Not found</error>
</company>
    XML
    result=Client.send(:parse_error,response_xml)    
    result.should eql("Not found")
  end

  it "should handle invalid/unknown input to parse_error" do
    response_xml=<<-XML
  <NOT_VALID_INPUT>bla bla</NOT_VALID_INPUT>
    XML
    result=Client.send(:parse_error,response_xml)    
    result.should eql("Unable to parse error message from client. Response:   <NOT_VALID_INPUT>bla bla</NOT_VALID_INPUT>\n")
  end

  it "should handle RestClient Expections" do
    RestClient.stub(:get).and_raise(RestClient::RequestFailed)
    response=Client.find_company_by_name("Should fail")    
    response[0..20].should eql("Unable to parse error")
  end

  it "should handle unknown Expections" do
    RestClient.stub(:get).and_raise(RuntimeError)
    response=Client.find_company_by_name("Should fail")    
    response[0..20].should eql("Client error: Runtime")
  end

end
