class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.5.4"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.5.4/joker-linux-amd64.zip"
    sha256 "d5f82d9fe60a2aaa31a00d58783036eff2a21a625e1f08bcb1b0d9353b49ba51"
  else
    url "https://github.com/candid82/joker/releases/download/v1.5.4/joker-mac-amd64.zip"
    sha256 "4b3e4c6e9921fc003ad339e45a2fbdb9c98c44d210248d9f464d15fcfa0d410a"
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
