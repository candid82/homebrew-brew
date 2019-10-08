class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.12.9"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.12.9/joker-0.12.9-linux-amd64.zip"
    sha256 "b773dcd40df73436a4393dcb5ad7874e1483a3f9dc9cc62a353fc4c432629050"
  else
    url "https://github.com/candid82/joker/releases/download/v0.12.9/joker-0.12.9-mac-amd64.zip"
    sha256 "7bbb25d737387cdba962ecb8ffe51a02ae4e9b9023f125a9ecadb09123033ccc"
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
