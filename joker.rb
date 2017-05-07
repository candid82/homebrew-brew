class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  url "https://github.com/candid82/joker/releases/download/v0.8.0/joker-0.8.0-mac-amd64.zip"
  sha256 "5b7f3f3b04efc5913b70e25344d5c457a7247a943fb61346048867c4cb42c5f9"
  version "0.8.0"

  bottle :unneeded

  def install
    bin.install "joker"
  end

  test do
    system "#{bin}/joker", "--version"
  end
end
