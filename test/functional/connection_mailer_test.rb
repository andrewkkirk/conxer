require 'test_helper'

class ConnectionMailerTest < ActionMailer::TestCase

  def setup
    @connection = FactoryGirl.create(:connection)
  end

  # test "accept url is included" do
    ConnectionMailer.connectee1_email(@connection)
    sent = ActionMailer::Base.deliveries.first
    assert_equal [@connection.connectee1.email], sent.to
  #   # assert sent.html_part.body =~ /connections\/#{@connection.id}\/accept\/?cid=#{@connection.connectee1.id}/, "url not included in html body text"
  #   # assert sent.text_part.body =~ /connections\/#{@connection.id}\/accept\/?cid=#{@connection.connectee1.id}/, "url not included in text body text"
  #   #need to correct Regex in sent.html_part.body and sent.text_part.body
  # end

  test "connection_established_email" do
    ConnectionMailer.connection_established_email(@connection)
    sent = ActionMailer::Base.deliveries.first
    assert_equal [@connection.connectee1.email], sent.to
    assert_equal [@connection.connectee2.email], sent.cc
  end
end
