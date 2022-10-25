class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.0.2"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.0.2/joker-linux-amd64.zip"
    sha256 "1d27a24b4c6b60d4e83579934ae0b1f9044eda3ef4886a7d619300b196b4a732"
  else
    url "https://github.com/candid82/joker/releases/download/v1.0.2/joker-mac-amd64.zip"
    sha256 "8f889bf0b9aac56a9e77ea2aecd710a9ade6074fce9d3dec455f2cb3a377ffbc"
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
