class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.7.1"

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.7.1/joker-linux-arm64.zip"
    sha256 "0dfbcec6f7a2658dfbb55bd1f915e1c60b7d69b7ffe5354e3fd7f46a7fc684bb" # linux-arm64
  elsif OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.7.1/joker-linux-amd64.zip"
    sha256 "6b3cc468b92ee20c891020cd60ab98b46f40c7fb5b41a32faaa3e63730c103a1" # linux-amd64
  elsif Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.7.1/joker-mac-arm64.zip"
    sha256 "3c8dd3b5602b75faa90ab70f20460c3b00e22aeebffb81dcf34408d3942a4173" # mac-arm64
  else
    url "https://github.com/candid82/joker/releases/download/v1.7.1/joker-mac-amd64.zip"
    sha256 "56afdb202253866a9ef6eb4c62d44cccdef6016b3de1e7735ae5810a17bb5bbf" # mac-amd64
  end

  def install
    bin.install "joker"
  end

  test do
    testfile = testpath/"test.clj"
    testfile.write "(let [x 1] (println 42))"

    assert_match "Parse warning: unused binding: x",
      shell_output("#{bin}/joker --lint --dialect clj #{testfile} 2>&1")
  end
end
