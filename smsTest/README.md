# Important: 


in `/lib/smsTest_web/controllers/page_controller.ex`, replace `encodedToken` parameters with proper credentials from twillio. (daniel has account.)

enter valid phone number to send a text message from twillio. Body should say : 

`Sent from your Twilio trial account - Test Message from elixir!`

### Test app landing page. Enter valid phone number to send message.
![Image](phoenix-landing.png)

### Received text on phone.  
![Image](sms-phone.png)



## achieved sending sms via twillio api in elixilr. 

successful post response looks like this: 
```json
  {:ok,
   %HTTPoison.Response{
     body: "{\"sid\": \"SMd04b48f74e8f4a8880bf2ad3094bc9dd\", \"date_created\": \"Thu, 18 Mar 2021 18:49:41 +0000\", \"date_updated\": \"Thu, 18 Mar 2021 18:49:41 +0000\", \"date_sent\": null, \"account_sid\": \"AC1259ba576ff64b91a9c69fe487f7493e\", \"to\": \"+[redacted]\", \"from\": null, \"messaging_service_sid\": \"MG7e76a0fbe7dd06db319d212769aa01ec\", \"body\": \"Test Message from elixir!\", \"status\": \"accepted\", \"num_segments\": \"0\", \"num_media\": \"0\", \"direction\": \"outbound-api\", \"api_version\": \"2010-04-01\", \"price\": null, \"price_unit\": null, \"error_code\": null, \"error_message\": null, \"uri\": \"/2010-04-01/Accounts/AC1259ba576ff64b91a9c69fe487f7493e/Messages/SMd04b48f74e8f4a8880bf2ad3094bc9dd.json\", \"subresource_uris\": {\"media\": \"/2010-04-01/Accounts/AC1259ba576ff64b91a9c69fe487f7493e/Messages/SMd04b48f74e8f4a8880bf2ad3094bc9dd/Media.json\"}}",
     headers: [
       {"Date", "Thu, 18 Mar 2021 18:49:41 GMT"},
       {"Content-Type", "application/json"},
       {"Content-Length", "812"},
       {"Connection", "keep-alive"},
       {"Twilio-Concurrent-Requests", "1"},
       {"Twilio-Request-Id", "RQ24d0d3635b12311b919765da211d4b1d"},
       {"Twilio-Request-Duration", "0.126"},
       {"Access-Control-Allow-Origin", "*"},
       {"Access-Control-Allow-Headers",
        "Accept, Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since"},
       {"Access-Control-Allow-Methods", "GET, POST, DELETE, OPTIONS"},
       {"Access-Control-Expose-Headers", "ETag"},
       {"Access-Control-Allow-Credentials", "true"},
       {"X-Powered-By", "AT-5000"},
       {"X-Shenanigans", "none"},
       {"X-Home-Region", "us1"},
       {"X-API-Domain", "api.twilio.com"},
       {"Strict-Transport-Security", "max-age=31536000"}
     ],
     request: %HTTPoison.Request{
       body: {:form,
        [
          To: "2019376882",
          MessagingServiceSid: "MG7e76a0fbe7dd06db319d212769aa01ec",
          Body: "Test Message from elixir!"
        ]},
       headers: [
         Authorization: "Basic QUMxMjU5YmE1NzZmZjY0YjkxYTljNjlmZTQ4N2Y3NDkzZTpjYjM0YmM1M2Q1MWZiOTdhM2QxOTcyYWQwMzU2Y2I3MQ=="
       ],
       method: :post,
       options: [],
       params: %{},
       url: "https://api.twilio.com/2010-04-01/Accounts/AC1259ba576ff64b91a9c69fe487f7493e/Messages.json"
     },
     request_url: "https://api.twilio.com/2010-04-01/Accounts/AC1259ba576ff64b91a9c69fe487f7493e/Messages.json",
     status_code: 201
   }}
```

---

# Future resources:

parsing post-response for success/error 
https://stackoverflow.com/questions/46633620/make-http-request-with-elixir-and-phoenix


dep for http request in elixir -> make post req to twillio sms api 
https://github.com/edgurgel/httpoison


---

# SmsTest

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
