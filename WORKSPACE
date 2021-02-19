load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Get copy paste instructions for the http_archive attributes from the
# release notes at https://github.com/bazelbuild/rules_docker/releases
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "1698624e878b0607052ae6131aa216d45ebb63871ec497f26c67455b34119c80",
    strip_prefix = "rules_docker-0.15.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.15.0/rules_docker-v0.15.0.tar.gz"],
)

load("@io_bazel_rules_docker//toolchains/docker:toolchain.bzl",
    docker_toolchain_configure="toolchain_configure"
)
docker_toolchain_configure(name = "docker_config")

load(
  "@io_bazel_rules_docker//repositories:repositories.bzl",
  container_repositories = "repositories",
)
container_repositories()

# Deps
load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")
container_deps()

# Base image
load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)
container_pull(
  name = "java_base",
  registry = "gcr.io",
  repository = "distroless/java",
  tag = "latest" # is also supported, but digest is encouraged for reproducibility.
  # digest = "sha256:deadbeef",
)

container_pull(
    name = "scala-sbt",
    registry = "index.docker.io",
    repository = "hseeberger/scala-sbt",
    tag = "11.0.3_1.2.8_2.13.0",
)
