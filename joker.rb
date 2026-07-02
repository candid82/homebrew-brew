class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.9.0"

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.9.0/joker-linux-arm64.zip"
    sha256 "5cc32730cdc445af83c4646c7b5a7ce730283f41bca3d11a3f09f3eb41570b35" # linux-arm64
  elsif OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.9.0/joker-linux-amd64.zip"
    sha256 "889cb607bc15ccdbc831e134fe3f91cf29cfa75481c91d933ebbc62bc7177381" # linux-amd64
  elsif Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.9.0/joker-mac-arm64.zip"
    sha256 "4be29b008dacbd2ed15fad2190732ed8c651f16e8d36a7fd69070d2ac27d1d18" # mac-arm64
  else
    url "https://github.com/candid82/joker/releases/download/v1.9.0/joker-mac-amd64.zip"
    sha256 "77dd62a0a8d686dea4aec854597f3d1a3f40ec6410b7cb281ae427128e8a6af8" # mac-amd64
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
