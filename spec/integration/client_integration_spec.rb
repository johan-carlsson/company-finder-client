require 'company/finder/client'
include Company::Finder

SERVER_URL="http://0.0.0.0:3000"

describe Client do
  it "finds company identity numbers give a name" do
    response=Client.find_company_by_name("Redpill Linpro AB")
    response.should eql("556641-0576")
  end  

  it "returns an error message when it can't find a company" do
    response=Client.find_company_by_name("ANoneExistingCompany")
    response.should eql("Not found")
  end

  it "should return Client Error on network errors" do
    # This hack makes the test a bit slow, sorry for that
    Client.stub(:url).and_return("http://169.169.169.169/nope")
    response=Client.find_company_by_name("A company")
    response[0..20].should eql("Client error: Network")
  end


end
