package(default_visibility = ["//visibility:public"])

load("//rules:docker.bzl", "docker_build")

docker_build(
	name = "ruby-2.6.3",
	dockerfile = "Dockerfile",
	froms = ["//src/containers/buildpack-deps-19.10"],
	test_command = "ruby -v",
	test_value = "2.6.3",
)