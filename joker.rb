class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.0.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.0.0/joker-1.0.0-linux-amd64.zip"
    sha256 "ce37aaa795d30b777abd3f7368162a610cff0bc5302e2fabc1719b475b256a10"
  else
    url "https://github.com/candid82/joker/releases/download/v1.0.0/joker-1.0.0-mac-amd64.zip"
    sha256 "a991c13d798cebdd4aa6eacf13b8e8fcdab37a76fecd8526d419718ed31865aa"
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
