defmodule Servy.Plugins do
  alias Servy.Conv

  @doc """
  Logs 404
  """
  def track(%Conv{status: 404, path: path} = conv) do
    IO.puts("Warning: #{path} is on the loose!")
    conv
  end

  def track(%Conv{} = conv), do: conv

  def rewrite_query_string_to_path(%{path: "/bears?id=" <> id} = conv) do
    %{conv | path: "/bears/#{id}"}
  end

  def rewrite_query_string_to_path(%Conv{} = conv), do: conv

  def rewrite_path(%Conv{path: "/wildlife"} = conv) do
    %{conv | path: "/wildthings"}
  end

  def rewrite_path(%Conv{} = conv), do: conv

  def log(%Conv{} = conv), do: IO.inspect(conv)
end
