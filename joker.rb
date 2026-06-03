class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.8.1"

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.8.1/joker-linux-arm64.zip"
    sha256 "20e6b09ea67f3ef63531e885e3d2dc5b270476ba0fb5a6522f5a012362992e48" # linux-arm64
  elsif OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.8.1/joker-linux-amd64.zip"
    sha256 "4b063e5d465bc05e4cebf1d8aaac37aa44b94baad744ffdf8260830ee1b31023" # linux-amd64
  elsif Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.8.1/joker-mac-arm64.zip"
    sha256 "0e9d8a1be5a65033ad2ac82a0a48517b2c6d353f656fb9510ca2b73ca8e3b23a" # mac-arm64
  else
    url "https://github.com/candid82/joker/releases/download/v1.8.1/joker-mac-amd64.zip"
    sha256 "fd3328eb1d3b31cf39058e687f2c9989cbd225304a1da13905760eaa50c6eb37" # mac-amd64
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
