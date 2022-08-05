class Milvusctl < Formula
  desc "Milvus k8s controller"
  homepage "https://github.com/milvus-io/milvusctl"
  url "https://github.com/milvus-io/milvusctl/releases/download/v0.1.0/milvusctl-macos"
  sha256 "3aeccb2324b2e9a6fd35f46944a4447b8403b2131e8fece44e70d32ba933fbdc"

  def install 
    bin.install "milvusctl-macos" => "milvusctl"
  end

  test do
    system "true"
  end
end
