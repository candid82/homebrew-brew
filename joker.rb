class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  url "https://github.com/candid82/joker/releases/download/v0.8.5/joker-0.8.5-mac-amd64.zip"
  sha256 "318543e6a812e62d340a093c1d2afc8fd3736985cdca7a5964f2a439469981ec"
  version "0.8.5"

  bottle :unneeded

  def install
    bin.install "joker"
  end

  test do
    system "#{bin}/joker", "--version"
  end
end
