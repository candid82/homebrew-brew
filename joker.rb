class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  url "https://github.com/candid82/joker/releases/download/v0.7.2/joker-0.7.2-mac-amd64.zip"
  sha256 "733fb2effdacd705c60763dcbe48a66b364134afa069fda83b53b9f7c5abb96d"

  bottle :unneeded

  def install
    bin.install "joker"
  end

  test do
    system "#{bin}/joker", "--version"
  end
end
