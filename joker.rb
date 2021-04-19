class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.17.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.17.0/joker-0.17.0-linux-amd64.zip"
    sha256 "4e71b0e6c895128bf7c9d61e81be5419e144863e6b874555bf02b630cf619a1c"
  else
    url "https://github.com/candid82/joker/releases/download/v0.17.0/joker-0.17.0-mac-amd64.zip"
    sha256 "f08e59d11feed190731e8218d9508a7b6989b09308ed4786f4675628f0154d81"
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
