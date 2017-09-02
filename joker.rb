class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  url "https://github.com/candid82/joker/releases/download/v0.8.4/joker-0.8.4-mac-amd64.zip"
  sha256 "ed8db220c37016033c22831497efea22d2c57e30272ab51a7821376455296760"
  version "0.8.4"

  bottle :unneeded

  def install
    bin.install "joker"
  end

  test do
    system "#{bin}/joker", "--version"
  end
end
