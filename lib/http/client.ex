defmodule Http.Client do
  @callback get(slug :: String.t()) :: {:ok, response :: map}

  def get(slug) do
    HTTPoison.get("https://clube.netshoes.com.br/#{slug}")
  end
end
