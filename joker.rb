class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.3.2"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.3.2/joker-linux-amd64.zip"
    sha256 "029057f4d103e68d59b2c050fc8968d7da05a73575106b5de0dcbad4a27776b0"
  else
    url "https://github.com/candid82/joker/releases/download/v1.3.2/joker-mac-amd64.zip"
    sha256 "0a19a3090d524d82cb3e1e524de6243c296b01d120bbf903d1fbedbc0ee6d295"
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
