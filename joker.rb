class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.3.5"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.3.5/joker-linux-amd64.zip"
    sha256 "ce1b0325610109f2819c0712b66bb8a4278b42f1224d92bd6a55435e8533745b"
  else
    url "https://github.com/candid82/joker/releases/download/v1.3.5/joker-mac-amd64.zip"
    sha256 "63a1de9916173ef2e1f184e0269572252d4960e5cc2a443ee0fe7cb0ede65fca"
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
