defmodule Http.ClientBehaviour do
  @callback get(slug :: String.t()) ::
              {:ok, HTTPoison.Response.t() | HTTPoison.AsyncResponse.t()}
              | {:error, HTTPoison.Error.t()}
end
