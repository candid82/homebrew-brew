class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.3.4"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.3.4/joker-linux-amd64.zip"
    sha256 "1e3b533539b8e958cf280df273e932f82e5f652ee172ed51b7dc73adaebb3f9d"
  else
    url "https://github.com/candid82/joker/releases/download/v1.3.4/joker-mac-amd64.zip"
    sha256 "05132b76ec7ae53a2d16260a33c9edbd6e15db0dcdf53094a53155fb681819e9"
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
