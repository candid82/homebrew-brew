class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.7.2"

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.7.2/joker-linux-arm64.zip"
    sha256 "1e829ad607ad75a91b5883bc475b0bf10cec5461adb52b04ab7e4a86f16b568e" # linux-arm64
  elsif OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.7.2/joker-linux-amd64.zip"
    sha256 "8657a47f36c67affe7a4d78999f257c8acd8d5537627dd32f22751144498a4ed" # linux-amd64
  elsif Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.7.2/joker-mac-arm64.zip"
    sha256 "be45c68342e01b89f43bcb4c8833f56c0346807dc113a4209cc8c0a4bbc18349" # mac-arm64
  else
    url "https://github.com/candid82/joker/releases/download/v1.7.2/joker-mac-amd64.zip"
    sha256 "3f64eb4a6f0d22611f2d725f6736fae70cb3671ec93840d67fc431d7e138f2a4" # mac-amd64
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
