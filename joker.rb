class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.9.1"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.9.1/joker-0.9.1-linux-amd64.zip"
    sha256 "4e0ebc135af960cd9946632abb35df3fee65359d8e8f1aaa0b7b56381059a9e1"
  else
    url "https://github.com/candid82/joker/releases/download/v0.9.1/joker-0.9.1-mac-amd64.zip"
    sha256 "ca325bd65168f3bccfdec16a80dffad357421174a5a1e7dfb25a7afcc1c9f2ac"
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
