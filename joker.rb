class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.13.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.13.0/joker-0.13.0-linux-amd64.zip"
    sha256 "cb0269c88169d5c90a1ebe37fbb0971d5aa253bcc10cfd032e26aa80bc929eab"
  else
    url "https://github.com/candid82/joker/releases/download/v0.13.0/joker-0.13.0-mac-amd64.zip"
    sha256 "9303df6b519172a62e0cd948359c9bed560911fbc4b027641840d357c289cdc5"
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
