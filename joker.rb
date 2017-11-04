class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  url "https://github.com/candid82/joker/releases/download/v0.8.6/joker-0.8.6-mac-amd64.zip"
  sha256 "ca87520d02803a0f9c468b849671a61e6638eada34eef13c54a5386dd009a176"
  version "0.8.6"

  bottle :unneeded

  def install
    bin.install "joker"
  end

  test do
    system "#{bin}/joker", "--version"
  end
end
