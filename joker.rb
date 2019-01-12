class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.11.1"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.11.1/joker-0.11.1-linux-amd64.zip"
    sha256 "a4caefbe848adc24e563d000193f894e9ac18b31cef46bf64772d92d29ae4e59"
  else
    url "https://github.com/candid82/joker/releases/download/v0.11.1/joker-0.11.1-mac-amd64.zip"
    sha256 "d1c4f500f4d2b245b881deb43d53fd97c20828accd9dd8516560b4bc698e3b5d"
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
