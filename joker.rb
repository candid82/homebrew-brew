class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.15.4"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.15.4/joker-0.15.4-linux-amd64.zip"
    sha256 "e4aaced1745a4a7d245499c117d79defc058c1edaf1d3186a35e6cfa38c3855e"
  else
    url "https://github.com/candid82/joker/releases/download/v0.15.4/joker-0.15.4-mac-amd64.zip"
    sha256 "dc53e74b43033558a36b3c786f3999f0e092a6ef682486ae0392dcc3e1732b19"
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
