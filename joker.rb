class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.10.1"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.10.1/joker-0.10.1-linux-amd64.zip"
    sha256 "cc0a663258eee396fe8b52092d7a0676b914906dafec91450731864bd322a860"
  else
    url "https://github.com/candid82/joker/releases/download/v0.10.1/joker-0.10.1-mac-amd64.zip"
    sha256 "0c51a8b34889c1bb5fd692c6b65aaa222041fa1aa090a5b0f7046310f3e5101d"
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
