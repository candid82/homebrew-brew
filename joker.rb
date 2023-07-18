class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.2.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.2.0/joker-linux-amd64.zip"
    sha256 "cfb491cf33379c06c0f8a9e992db81a295f7cf710c7da0ebc1b85a9488674cba"
  else
    url "https://github.com/candid82/joker/releases/download/v1.2.0/joker-mac-amd64.zip"
    sha256 "a48cbe88cf1eac9c6f9f039fc96ca02007707d6037a3f51c19dce74bbf18a8da"
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
