class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  url "https://github.com/candid82/joker/releases/download/v0.8.7/joker-0.8.7-mac-amd64.zip"
  sha256 "7cf467c14a4f38bd2f5d222968c62a31b37e37ef86388b8e215b51f7e07d1343"
  version "0.8.7"

  bottle :unneeded

  def install
    bin.install "joker"
  end

  test do
    system "#{bin}/joker", "--version"
  end
end
