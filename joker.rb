class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.15.5"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.15.5/joker-0.15.5-linux-amd64.zip"
    sha256 "5e0e6e4fb67d1b7f45a1d9c8a9185fccc3322cd0898114a0c4f726acbaa731d4"
  else
    url "https://github.com/candid82/joker/releases/download/v0.15.5/joker-0.15.5-mac-amd64.zip"
    sha256 "97fe570d5a6d94e3cf2e7a3991d50df767fcf9ec6e19fdfcdc87c00aada30e04"
  end

  bottle :unneeded

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
