class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.9.4"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.9.4/joker-0.9.4-linux-amd64.zip"
    sha256 "b2a8defd21397d05094927c54c0147b901ed34300d8f24c73c839f8cf7f9b043"
  else
    url "https://github.com/candid82/joker/releases/download/v0.9.4/joker-0.9.4-mac-amd64.zip"
    sha256 "719f7564aeabf624bb3cf36545d9afb48f591a98a1498ec80969ee73c5413209"
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
