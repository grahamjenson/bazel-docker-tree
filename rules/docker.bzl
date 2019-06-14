def _docker_build(ctx):
  name = ctx.attr.name
  folder = ctx.file.dockerfile.dirname

  froms = [f.image_sha for f in ctx.attr.froms]

  ctx.actions.run(
    executable = ctx.executable._docker_tool,
    inputs = ctx.files.dockerfile + froms,
    arguments = [
      ctx.outputs.imagesha.path,
      "build",
      "-q",
      "-t", name + ":bazel",
      "-f", ctx.file.dockerfile.path,
      folder
    ],
    outputs = [ctx.outputs.imagesha],
  )


  froms_file = ctx.actions.declare_file("froms")

  print(froms)
  ctx.actions.write(froms_file, str(froms))

  return struct(
    image_name = name,
    image_sha = ctx.outputs.imagesha,
  )

docker_build = rule(
  implementation = _docker_build,
  attrs = {
    "dockerfile": attr.label(
      allow_single_file = True,
      mandatory = True,
    ),
    "froms": attr.label_list(),
    "_docker_tool": attr.label(
      executable = True,
      cfg = "host",
      allow_files = True,
      default = Label("//rules:docker"),
    ),
  },
  outputs = {
    "imagesha": "sha"
  },
)