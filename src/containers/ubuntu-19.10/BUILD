package(default_visibility = ["//visibility:public"])

load("//rules:docker.bzl", "docker_build")

docker_build(
	name = "ubuntu-19.10",
	dockerfile = "Dockerfile",
	test_command = "grep -e VERSION /etc/*release",
	test_value = "19.10",
	)