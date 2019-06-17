def _docker_build(ctx):
  froms = [f.image_digest for f in ctx.attr.froms]

  ctx.actions.run(
    executable = ctx.executable._docker_tool,
    inputs = ctx.files.dockerfile + froms,
    arguments = [
      ctx.attr.name,
      ctx.file.dockerfile.path,
      ctx.outputs.image_digest.path,
      ctx.attr.test_command,
      ctx.attr.test_value,
    ],
    outputs = [ctx.outputs.image_digest],
  )

  return struct(
    image_digest = ctx.outputs.image_digest,
  )

docker_build = rule(
  implementation = _docker_build,
  attrs = {
    "dockerfile": attr.label(
      allow_single_file = True,
      mandatory = True,
    ),
    "froms": attr.label_list(),
    "test_command": attr.string(),
    "test_value": attr.string(),
    "_docker_tool": attr.label(
      executable = True,
      cfg = "host",
      allow_files = True,
      default = Label("//rules:docker"),
    ),
  },
  outputs = {
    "image_digest": "image_digest"
  },
)
