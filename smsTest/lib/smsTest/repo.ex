defmodule SmsTest.Repo do
  use Ecto.Repo,
    otp_app: :smsTest,
    adapter: Ecto.Adapters.Postgres
end
