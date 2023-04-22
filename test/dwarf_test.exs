defmodule DwarfTest do
  import Mox

  use ExUnit.Case

  setup :verify_on_exit!

  test "must returns tênis fila racer carbon masculino - branco+vermelho" do
    slug = "tenis-fila-racer-carbon-masculino-branco+vermelho-D29-8234-024"

    ClientMock
    |> expect(:get, fn ^slug ->
      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: Path.join(["test", "fixtures", "racer_carbon.html"]) |> File.read!()
       }}
    end)

    assert NetShoes.get(slug) == %{title: "Tênis Fila Racer Carbon Masculino - Branco+Vermelho"}
  end
end
