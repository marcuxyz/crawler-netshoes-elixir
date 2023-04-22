defmodule NetShoes do
  @http_client Application.compile_env(:dwarf, :http_client, Client)

  def get(slug) do
    with {:ok, response} <- @http_client.get(slug) do
      response
      |> Map.get(:body)
      |> data()
    end
  end

  defp data(html) do
    %{
      title: extract_title(html),
      original_price: extract_original_price(html),
      price: extract_price(html)
    }
  end

  defp extract_title(html) do
    html
    |> Floki.find("div.short-showcase-description > section > h1")
    |> Floki.text()
  end

  defp extract_original_price(html) do
    html
    |> Floki.find("div.price.price-box.mult-seller > del")
    |> Floki.text()
  end

  defp extract_price(html) do
    html
    |> Floki.find("div.price.price-box.mult-seller > div > span:nth-child(1) > strong")
    |> Floki.text()
  end
end

defmodule Client do
  @callback get(slug :: String.t()) :: {:ok, response :: map}

  def get(slug) do
    HTTPoison.get("https://clube.netshoes.com.br/#{slug}")
  end
end
