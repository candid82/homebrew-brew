class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  url "https://github.com/candid82/joker/releases/download/v0.8.3/joker-0.8.3-mac-amd64.zip"
  sha256 "8f7b633a3d59fa7aacff28b6ec82c054463c1598499089e15368cdf9c0a70b7c"
  version "0.8.3"

  bottle :unneeded

  def install
    bin.install "joker"
  end

  test do
    system "#{bin}/joker", "--version"
  end
end
