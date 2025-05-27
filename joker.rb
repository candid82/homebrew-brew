class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.5.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.5.0/joker-linux-amd64.zip"
    sha256 "5b4b459b5bc686ad654626532b67e059a6103bfea4b0da0ada47df03b5fd8076"
  else
    url "https://github.com/candid82/joker/releases/download/v1.5.0/joker-mac-amd64.zip"
    sha256 "a32fdbc1c53760389281530c9ede8c0e40b382a9cbbb6b675669c44f1e6655c9"
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
