class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.6.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.6.0/joker-linux-amd64.zip"
    sha256 "bc3e6bb88fdc79421a5beab5a56c93871ba94f6e121740cfd950e50e48783cf7" # linux-amd64
  elsif Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.6.0/joker-mac-arm64.zip"
    sha256 "9b4e68121c94f7c565137603d0614aa31605fffb505ed708af14503e3207c727" # mac-arm64
  else
    url "https://github.com/candid82/joker/releases/download/v1.6.0/joker-mac-amd64.zip"
    sha256 "d8827ee055e0a92ba2868b473aa7b1f232539cf2c036891cd18efc0ed3cdb624" # mac-amd64
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
