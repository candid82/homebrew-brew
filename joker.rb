class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.0.1"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.0.1/joker-1.0.1-linux-amd64.zip"
    sha256 "b70029dac7651e5ef62a7de2f37169b4ef488ab0cb93786a88d37d09e3f4f7f9"
  else
    url "https://github.com/candid82/joker/releases/download/v1.0.1/joker-1.0.1-mac-amd64.zip"
    sha256 "49f8b6f3323e925829dd3075fb7fdf38cb44aa7c78245b690bf9a3b64a9a134b"
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
