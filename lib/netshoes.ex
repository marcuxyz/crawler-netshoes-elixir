defmodule NetShoes do
  alias Http.Client

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
      title: extract_product_information(html, "div.short-showcase-description > section > h1"),
      original_price: extract_product_information(html, "div.price.price-box.mult-seller > del"),
      price:
        extract_product_information(
          html,
          "div.price.price-box.mult-seller > div > span:nth-child(1) > strong"
        )
    }
  end

  defp extract_product_information(html, element), do: html |> Floki.find(element) |> Floki.text()
end
