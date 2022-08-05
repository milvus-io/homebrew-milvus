class Milvusctl < Formula
  desc "Milvus k8s controller"
  homepage "https://github.com/milvus-io/milvusctl"
  url "https://github.com/milvus-io/milvusctl/releases/download/v0.1.0/milvusctl-macos"
  sha256 "1f5aa4422bacbac22a74fe5f0a204ca1330890c3"

  def install 
    bin.install "milvusctl-macos" => "milvusctl"
  end

  test do
    system "true"
  end
end
