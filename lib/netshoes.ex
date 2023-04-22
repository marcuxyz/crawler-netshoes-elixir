defmodule NetShoes do
  @http_client Application.compile_env(:dwarf, :http_client, Client)

  def get(slug) do
    with {:ok, response} <- @http_client.get(slug) do
      response
      |> Map.get(:body)
      |> extract_title()
    end
  end

  def extract_title(html) do
    html
    |> Floki.find(
      "#content > div:nth-child(3) > section > div.short-showcase-description > section > h1"
    )
    |> Floki.text()
  end
end

defmodule Client do
  @callback get(slug :: String.t()) :: {:ok, response :: map}

  def get(slug) do
    HTTPoison.get("https://clube.netshoes.com.br/#{slug}")
  end
end
