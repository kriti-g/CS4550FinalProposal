defmodule SmsTestWeb.PageController do
  use SmsTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def sendSMS(conn, %{"x" => phone_number}) do
    IO.inspect([:sendSMS, phone_number])


    # https://www.twilio.com/docs/sms/api/message-resource#create-a-message-resource
    # specific formatting: https://github.com/edgurgel/httpoison/issues/109
    url = "https://api.twilio.com/2010-04-01/Accounts/AC1259ba576ff64b91a9c69fe487f7493e/Messages.json"
    to_number = phone_number
    messagingServiceSid = "MG7e76a0fbe7dd06db319d212769aa01ec"
    body = "Test Message from elixir!"

    encodedToken = "Basic " <> Base.encode64("<AccountSid>:<AuthToken>") # redacted.

    b = HTTPoison.post(url,
    {:form, [To: to_number, MessagingServiceSid: messagingServiceSid, Body: body]},
    %{"Authorization": encodedToken})

    IO.inspect([:sendSMS, b])
    render(conn, "SMSSent.html")

  end
end
