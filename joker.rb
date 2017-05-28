class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  url "https://github.com/candid82/joker/releases/download/v0.8.1/joker-0.8.1-mac-amd64.zip"
  sha256 "da68c12a7e8c883e2c60d8b74149a1776f0938e5c178cebb6e5aa77fe5a87254"
  version "0.8.1"

  bottle :unneeded

  def install
    bin.install "joker"
  end

  test do
    system "#{bin}/joker", "--version"
  end
end
