class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  url "https://github.com/candid82/joker/releases/download/v0.8.2/joker-0.8.2-mac-amd64.zip"
  sha256 "97c672761a1ad887cfc4b76cc9574bd566f8ae157c26c862e86676b02275cbfb"
  version "0.8.2"

  bottle :unneeded

  def install
    bin.install "joker"
  end

  test do
    system "#{bin}/joker", "--version"
  end
end
