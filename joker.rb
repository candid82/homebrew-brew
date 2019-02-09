class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.12.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.12.0/joker-0.12.0-linux-amd64.zip"
    sha256 "3dc8439a04a26ab0cb0e115067c1ec41a2e7c9c2a2d0d4937c0532cd633ccf91"
  else
    url "https://github.com/candid82/joker/releases/download/v0.12.0/joker-0.12.0-mac-amd64.zip"
    sha256 "017369083771af66e8d2e8304443ec91faf21eaebd10379b67901c2fc20a549f"
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
