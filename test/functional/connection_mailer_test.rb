require 'test_helper'

class ConnectionMailerTest < ActionMailer::TestCase

  def setup
    @connection = Connection.new
  end

  def setup_associations
    @connection.connectee1.email = 'john@doe.com'
    @connection.connectee1.name = 'John Doe'
    @connection.connectee2.email = 'jane@doe.com'
    @connection.connectee2.name = 'Jane Doe'
    @connection.connector.name = 'Andrew Kirk'
    @connection.connector.email = 'andrewkkirk@gmail.com'
    @connection.reason = 'reason'
    @connection.save
  end

  test "accept url is generated" do
    setup_associations
    ConnectionMailer.connectee1_email(@connection)
    sent = ActionMailer::Base.deliveries.first
    assert_equal [@connection.connectee1.email], sent.to
    assert sent.html_part.body =~ /connections\/#{@connection.id}\/accept\/?cid=#{@connection.connectee1.id}/, "url not included in html body text"
    assert sent.text_part.body =~ /connections\/#{@connection.id}\/accept\/?cid=#{@connection.connectee1.id}/, "url not included in text body text"
  end
end
