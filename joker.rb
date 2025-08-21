class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.5.6"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.5.6/joker-linux-amd64.zip"
    sha256 "640f85b71d1d64a48c0aae56c44fc9b3a51e7b18f8b967c3197881c89e437377"
  else
    url "https://github.com/candid82/joker/releases/download/v1.5.6/joker-mac-amd64.zip"
    sha256 "6c06d84b5ec8491d704819688d796cb868b837c77d8e43d0843b169537d585fa"
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
