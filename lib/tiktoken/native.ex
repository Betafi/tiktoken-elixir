defmodule Tiktoken.Native do
  @moduledoc false

  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :tiktoken,
    crate: "tiktoken",
    base_url: "https://github.com/Betafi/tiktoken-elixir/releases/download/v#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILATION_TIKTOKEN_BUILD") in ["1", "true"],
    version: version

  def encoding_for_model(_model), do: err()

  def p50k_encode_ordinary(_input), do: err()
  def p50k_encode(_input, _allowed_special), do: err()
  def p50k_encode_with_special_tokens(_input), do: err()
  def p50k_decode(_ids), do: err()

  def p50k_edit_encode_ordinary(_input), do: err()
  def p50k_edit_encode(_input, _allowed_special), do: err()
  def p50k_edit_encode_with_special_tokens(_input), do: err()
  def p50k_edit_decode(_ids), do: err()

  def r50k_encode_ordinary(_input), do: err()
  def r50k_encode(_input, _allowed_special), do: err()
  def r50k_encode_with_special_tokens(_input), do: err()
  def r50k_decode(_ids), do: err()

  def cl100k_encode_ordinary(_input), do: err()
  def cl100k_encode(_input, _allowed_special), do: err()
  def cl100k_encode_with_special_tokens(_input), do: err()
  def cl100k_decode(_ids), do: err()

  defp err, do: :erlang.nif_error(:nif_not_loaded)
end
