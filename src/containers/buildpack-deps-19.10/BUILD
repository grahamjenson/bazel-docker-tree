package(default_visibility = ["//visibility:public"])

load("//rules:docker.bzl", "docker_build")

docker_build(
	name = "buildpack-deps-19.10",
	dockerfile = "Dockerfile",
	froms = ["//src/containers/ubuntu-19.10"],
)