load("//rules:docker.bzl", "docker_build")

docker_build(
	name = "ruby-2.6",
	dockerfile = "Dockerfile",
	froms = ["//src/containers/ubuntu"],
)