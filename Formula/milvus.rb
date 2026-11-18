class Milvus < Formula
  include Language::Python::Virtualenv

  desc "Vector database for similarity search"
  homepage "https://milvus.io/"
  url "https://github.com/milvus-io/milvus/archive/refs/tags/v3.0.6.tar.gz"
  sha256 "2a2610adac7712455bcd5fc8eff0da5ad0a51ea6ae0cffc3fc9c084b65ff22e7"
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on "go" => :build
  depends_on "libyaml" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "python@3.12" => :build
  depends_on "rustup" => :build
  depends_on "libomp"
  depends_on "librdkafka"
  depends_on "llvm@19"
  depends_on :macos

  # Conan's version is checked by the upstream build script. Keep it private
  # rather than upgrading the user's Python packages or global Conan cache.
  resource "certifi" do
    url "https://files.pythonhosted.org/packages/fd/11/b524cbd9bbdaca58608e4cf4053fd463417549e1959fa8d3aa18319f9555/certifi-2026.10.23.tar.gz"
    sha256 "a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a936dfb16aaaf36cd"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/33/1c/f41d4e74c28ab327ff3acd36053f7ea506c55872d7a90b0fa71aa3ab0c89/charset_normalizer-3.5.2.tar.gz"
    sha256 "39de2a259fc954455c57274dc94c79d5842774e1247a016aff30bc0efed0f4ef"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4/colorama-0.4.6.tar.gz"
    sha256 "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
  end

  resource "conan" do
    url "https://files.pythonhosted.org/packages/c7/c0/2802a4ece453aeef1a1872e70aa7260b8529d65a7f4b33d0cc2169ff1bbf/conan-2.25.1.tar.gz"
    sha256 "1d77d2457dfdbe919a68cee9d96bddde2b3411671a7d9e934df49c49faa2335d"
  end

  resource "fasteners" do
    url "https://files.pythonhosted.org/packages/2d/18/7881a99ba5244bfc82f06017316ffe93217dbbbcfa52b887caa1d4f2a6d3/fasteners-0.20.tar.gz"
    sha256 "55dce8792a41b56f727ba6e123fcaee77fd87e638a6863cec00007bfea84c8d8"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f5/08/8eea9d4b8302028f3abb2c0813953f7aec26d33b7a8960ed760e65ff29fa/idna-3.20.tar.gz"
    sha256 "a7db850025b95ded1eae8a46181a1a6c56c92c96f0e2b005d9ff8dc0210cab44"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz"
    sha256 "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/38/9b/e422a865e1d5d57d0e509b4e0bf1c1a70a7f6382c29a5aa428df994c8bc8/markupsafe-3.0.4.tar.gz"
    sha256 "2e9ad7dd851bf45fab9f75cbff4cb493fee9979e8d8c7c9c3ee119022518edd6"
  end

  resource "patch-ng" do
    url "https://files.pythonhosted.org/packages/ee/c0/53a2f017ac5b5397a7064c2654b73c3334ac8461315707cbede6c12199eb/patch-ng-1.18.1.tar.gz"
    sha256 "52fd46ee46f6c8667692682c1fd7134edc65a2d2d084ebec1d295a6087fc0291"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/ac/c3/e2a2b89f2d3e2179abd6d00ebd70bff6273f37fb3e0cc209f48b39d00cbf/requests-2.34.2.tar.gz"
    sha256 "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/e3/05/b17359e1cefb4f909b5e40b1b90a496d987258916dbbf88e842c729f510e/urllib3-2.8.0.tar.gz"
    sha256 "63bf2ead4c879426ebf22ef2a781eeb4aa3b4ae798a0435506f8687fd5bb9b63"
  end

  def install
    venv = virtualenv_create(buildpath/"conan-venv", "python3.12")
    venv.pip_install resources
    ENV["CONAN_CMD"] = buildpath/"conan-venv/bin/conan"
    ENV["CONAN_HOME"] = buildpath/".conan2"
    # The linker shim prepends these paths before OpenSSL's own -L. Do not
    # select a globally linked libcrypto while Conan builds its pinned version.
    library_paths = ENV["HOMEBREW_LIBRARY_PATHS"].to_s.split(File::PATH_SEPARATOR)
    library_paths.reject! { |path| path == (HOMEBREW_PREFIX/"lib").to_s }
    ENV["HOMEBREW_LIBRARY_PATHS"] = library_paths.join(File::PATH_SEPARATOR)
    # Homebrew provides libomp. milvus-common must not invoke brew again inside
    # superenv; keep all other recipes' system dependency checks enabled.
    (buildpath/".conan2").mkpath
    (buildpath/".conan2/global.conf").write <<~EOS
      milvus-common/*:tools.system.package_manager:mode=report
    EOS
    ENV["RUSTUP_HOME"] = buildpath/".rustup"
    ENV["CARGO_HOME"] = buildpath/".cargo"
    ENV["GOPATH"] = buildpath/".go"
    ENV["GOCACHE"] = buildpath/".go-cache"
    ENV["GOENV"] = buildpath/"go.env"
    # The upstream Makefile writes safe.directory; confine that to this build.
    ENV["GIT_CONFIG_GLOBAL"] = buildpath/"gitconfig"
    ENV["jobs"] = ENV.make_jobs.to_s
    ENV["CONAN_CPU_COUNT"] = ENV.make_jobs.to_s
    ENV.prepend_path "PATH", formula_opt_bin("rustup")
    # superenv does not expose the brew command to builds. Resolve declared
    # dependencies here instead of asking the upstream script to rediscover them.
    inreplace "scripts/setenv.sh" do |s|
      s.gsub! "for llvm_version in 21 20 19 18 17 16 15 14 NOT_FOUND", "for llvm_version in 19 NOT_FOUND"
      s.gsub! "if brew ls --versions llvm@${llvm_version} > /dev/null 2>&1; then",
              'if [[ "$llvm_version" == "19" ]]; then'
      s.gsub! "$(brew --prefix llvm@${llvm_version})", formula_opt_prefix("llvm@19").to_s
      s.gsub! "$(brew --prefix libomp)", formula_opt_prefix("libomp").to_s
    end
    # The release unconditionally enables ccache, which is not part of the
    # declared build environment. Use the compiler directly in this build.
    inreplace "scripts/3rdparty_build.sh" do |s|
      s.gsub! "export CMAKE_C_COMPILER_LAUNCHER=ccache", "unset CMAKE_C_COMPILER_LAUNCHER"
      s.gsub! "export CMAKE_CXX_COMPILER_LAUNCHER=ccache", "unset CMAKE_CXX_COMPILER_LAUNCHER"
      # Build-context tools (protoc) must match host Abseil's C++20 headers.
      s.gsub! "-s compiler.libcxx=libc++ -s compiler.cppstd=20",
              "-s compiler.libcxx=libc++ -s compiler.cppstd=20 -s:b compiler.cppstd=20"
    end

    system "rustup", "toolchain", "install", "1.92", "--profile", "minimal"
    system "rustup", "default", "1.92"
    # Conan launches make through subprocesses that do not inherit jobserver
    # pipes. Keep orchestration serial; jobs and CONAN_CPU_COUNT still parallelize
    # the actual CMake and Conan builds independently.
    build_args = ["MILVUS_VERSION=#{version}", "BUILD_TAGS=v#{version}",
                  "GIT_COMMIT=63100f8f5b4b675a12fe78fc9673b005ee318731"]
    ENV.deparallelize do
      system "make", "build-cpp", *build_args
      # Rust's staticlib also bundles bitcode from its prebuilt standard library.
      # Keep native code and symbols, but remove the embedded IR before Go/cgo
      # validates this archive. Do not relax Go's native-object security checks.
      system formula_opt_bin("llvm@19")/"llvm-objcopy",
             "--remove-section=__LLVM,__bitcode", "--remove-section=__LLVM,__cmdline",
             "internal/core/output/lib/libtantivy_binding.a"
      system "make", "print-build-info", "build-go", *build_args
    end

    (libexec/"bin").install "bin/milvus"
    # Both directories are needed: Conan imports dependencies to cmake_build,
    # while CMake installs Milvus's own libraries into internal/core/output.
    runtime_libraries = Dir["cmake_build/lib/*.dylib", "internal/core/output/lib/*.dylib"]
    odie "The build produced no native runtime libraries" if runtime_libraries.empty?
    (libexec/"lib").mkpath
    runtime_libraries.each do |path|
      source = Pathname(path)
      destination = libexec/"lib"/source.basename
      if destination.exist?
        odie "Conflicting runtime libraries: #{source.basename}" unless compare_file(source, destination)
        next
      end

      # Materialize Conan symlinks before its private build cache is removed.
      # Copy rather than move: multiple aliases may resolve to this same file.
      cp source.realpath, destination
    end
    relocate_runtime_libraries
    pkgshare.install "configs"

    # Use the stable opt path so services survive a Cellar version change.
    # Load commands are absolute. macOS does not apply DYLD_LIBRARY_PATH to
    # @rpath dependencies, and launchd strips DYLD_* before a service starts.
    (bin/"milvus").write <<~SH
      #!/bin/bash
      export MILVUSCONF="${MILVUSCONF:-#{etc}/milvus}"
      export DEPLOY_MODE="${DEPLOY_MODE:-STANDALONE}"
      exec "#{opt_libexec}/bin/milvus" "$@"
    SH
    chmod 0755, bin/"milvus"
  end

  def installed_macho_files
    libraries = (libexec/"lib").children.select { |path| path.file? && path.extname == ".dylib" }
    [libexec/"bin/milvus", *libraries]
  end

  # scripts/setenv.sh links every native image with Homebrew LLVM's libc++
  # (-L${llvm}/lib/c++ -lc++abi) and libomp. Those dylibs advertise @rpath
  # install names. Rewriting only libraries copied into libexec, then deleting
  # the build LC_RPATH entries, leaves libc++/libc++abi/libomp unresolved.
  # dyld aborts (exit 134) before the CLI can print usage.
  def absolute_runtime_libraries
    names = %w[libc++.1.dylib libc++abi.1.dylib libunwind.1.dylib libomp.dylib libomp.1.dylib]
    directories = [
      formula_opt_lib("llvm@19")/"c++",
      formula_opt_lib("llvm@19"),
      formula_opt_lib("libomp"),
    ]
    names.filter_map do |name|
      path = directories.lazy.map { |dir| dir/name }.find(&:exist?)
      [name, path.to_s] if path
    end.to_h
  end

  def macho_dependencies(file)
    Utils.safe_popen_read("/usr/bin/otool", "-L", file).lines.drop(1).map do |line|
      line.strip.split(" (").first
    end
  end

  def macho_rpaths(file)
    Utils.safe_popen_read("/usr/bin/otool", "-l", file)
         .scan(/cmd LC_RPATH\s+cmdsize \d+\s+path (.+) \(offset \d+\)/)
         .flatten
         .uniq
  end

  def relocate_runtime_libraries
    runtime = absolute_runtime_libraries
    %w[libc++.1.dylib libc++abi.1.dylib].each do |name|
      odie "Homebrew LLVM does not provide #{name}, required by the Milvus runtime" unless runtime[name]
    end

    installed_macho_files.each do |file|
      install_id = (opt_libexec/"lib"/file.basename).to_s if file.extname == ".dylib"
      system "/usr/bin/install_name_tool", "-id", install_id, file if install_id

      macho_dependencies(file).uniq.each do |dependency|
        next if dependency == install_id

        name = File.basename(dependency)
        replacement = if (libexec/"lib"/name).exist?
          (opt_libexec/"lib"/name).to_s
        else
          runtime[name]
        end
        next if replacement.nil? || replacement == dependency

        system "/usr/bin/install_name_tool", "-change", dependency, replacement, file
      end

      build_roots = [buildpath.to_s, buildpath.realpath.to_s].uniq
      macho_rpaths(file).each do |rpath|
        next unless build_roots.any? { |root| rpath.start_with?(root) }

        system "/usr/bin/install_name_tool", "-delete_rpath", rpath, file
      end
      # The Go executable has header padding for extra rpaths. Dylibs may not,
      # and their libc++/libomp dependencies are rewritten to absolute paths.
      if install_id.nil?
        [opt_libexec/"lib", formula_opt_lib("llvm@19")/"c++", formula_opt_lib("libomp")].each do |dir|
          next unless dir.directory?
          next if macho_rpaths(file).include?(dir.to_s)

          system "/usr/bin/install_name_tool", "-add_rpath", dir.to_s, file
        end
      end
      # Modifying Mach-O load commands invalidates the build's ad-hoc signature.
      system "/usr/bin/codesign", "--force", "--sign", "-", file
    end

    installed_macho_files.each { |file| assert_runtime_linkage!(file) }
  end

  def assert_runtime_linkage!(file)
    install_id = (opt_libexec/"lib"/file.basename).to_s if file.extname == ".dylib"
    build_roots = [buildpath.to_s, buildpath.realpath.to_s].uniq
    macho_dependencies(file).each do |dependency|
      next if dependency == install_id
      next if dependency.start_with?("/usr/lib/", "/System/")
      next if dependency.start_with?("#{opt_libexec}/lib/") && (libexec/"lib"/File.basename(dependency)).exist?
      next if dependency.start_with?("#{HOMEBREW_PREFIX}/opt/") && File.exist?(dependency)
      next if !dependency.start_with?("@") && build_roots.none? { |root| dependency.start_with?(root) } &&
               File.exist?(dependency)

      odie "#{file.basename} depends on #{dependency}, which does not survive installation"
    end
  end

  post_install_steps do
    mkdir_p "lib/milvus", base: :var
    mkdir_p "log/milvus", base: :var
    mkdir_p "milvus", base: :etc
    # Preserve configuration edits during reinstall and upgrade.
    copy "{{pkgshare}}/configs/milvus.yaml", "milvus/milvus.yaml", target_base: :etc, overwrite: false
    write_file "milvus/user.yaml", <<~YAML, base: :etc, overwrite: false
      # Local standalone profile; review before exposing this instance.
      etcd:
        auth:
          enabled: false
        use:
          embed: true
        data:
          dir: {{var}}/lib/milvus/etcd
        config:
          path: {{etc}}/milvus/embedEtcd.yaml
      common:
        storageType: local
      localStorage:
        path: {{var}}/lib/milvus/data
      mq:
        type: woodpecker
      woodpecker:
        storage:
          type: local
      rocksmq:
        path: {{var}}/lib/milvus/rdb_data
      proxy:
        ip: 127.0.0.1
      log:
        file:
          rootPath: {{var}}/log/milvus
      function:
        analyzer:
          local_resource_path: {{var}}/lib/milvus/analyzer
    YAML
    write_file "milvus/embedEtcd.yaml", <<~YAML, base: :etc, overwrite: false
      listen-client-urls: http://127.0.0.1:2379
      advertise-client-urls: http://127.0.0.1:2379
      listen-peer-urls: http://127.0.0.1:2380
      initial-advertise-peer-urls: http://127.0.0.1:2380
      initial-cluster: default=http://127.0.0.1:2380
      auto-compaction-mode: revision
      auto-compaction-retention: '1000'
    YAML
  end

  service do
    run [opt_bin/"milvus", "run", "standalone"]
    keep_alive true
    working_dir var/"lib/milvus"
    log_path var/"log/milvus/stdout.log"
    error_log_path var/"log/milvus/stderr.log"
  end

  def caveats
    <<~EOS
      This formula builds Milvus and its native dependencies from source.
      The initial profile uses embedded etcd and local storage for one standalone
      instance. This profile is pending maintainer review for milvus#32445.

      Configuration: #{etc}/milvus/{milvus,user,embedEtcd}.yaml
      Persistent data: #{var}/lib/milvus
      Logs: #{var}/log/milvus

      Existing configuration files are preserved on upgrade. Compare them with
      the new defaults in #{opt_pkgshare}/configs before restarting after an upgrade.
      Stop other local etcd/Milvus processes before starting this instance.
      Uninstalling the formula does not delete its configuration or data.
    EOS
  end

  test do
    # No-args usage must come from the installed executable itself. Upstream
    # exits 0 after writing this line; an abort here is a loader failure.
    assert_match "milvus run [server type]",
                 shell_output("env -u DYLD_LIBRARY_PATH -u DYLD_FALLBACK_LIBRARY_PATH #{bin}/milvus 2>&1")
  end
end
