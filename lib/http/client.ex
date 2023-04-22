defmodule Http.Client do
  @behaviour Http.ClientBehaviour

  def get(slug) do
    HTTPoison.get("https://clube.netshoes.com.br/#{slug}")
  end
end
