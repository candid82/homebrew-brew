class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.18.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.18.0/joker-0.18.0-linux-amd64.zip"
    sha256 "07518ba2a8dba1585cdffbf0b04f230e50d0acceb9d7c87cc424b4be85966431"
  else
    url "https://github.com/candid82/joker/releases/download/v0.18.0/joker-0.18.0-mac-amd64.zip"
    sha256 "7fa79479e8aedbbee7edb614584c3c9ac279e1dc7b84906b32695a16b8af4c5b"
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
