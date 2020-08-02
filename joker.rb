class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.15.6"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.15.6/joker-0.15.6-linux-amd64.zip"
    sha256 "11b7a51c99f92037ba361f59dd8d9bc342d8f86f3b30101bfe92a157eaae4f97"
  else
    url "https://github.com/candid82/joker/releases/download/v0.15.6/joker-0.15.6-mac-amd64.zip"
    sha256 "22ae30aad7605572b78a3fdaa04df8a5ce1f5af24818263108cefa5579eb7cdf"
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
