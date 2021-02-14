"""
Rule that creates Scala jar file using scala sbt tool
"""

def _sbt_package(ctx):
    ctx.actions.run_shell(
        # Output file name that must be created by the action.
        outputs = [ctx.outputs.jar],
        command = "docker ps -a",
        # executable = [ctx.attr.script],
        tools = ['sbt']
        mnemonic = "sbtpackage",
        progress_message = "Scala Jar Package",
        env = ctx.attr.env
    )

    # Tell Bazel that the files to build for this target includes
    # a `jar`.
    return [DefaultInfo(files = depset([ctx.outputs.jar]))]

sbt_package = rule(
    implementation = _sbt_package,
    attrs = {
        "jar": attr.output(
            mandatory = True,
            doc = "The name of jar file which needed to be created",
        ),
        # "script": attr.string(
        #     mandatory = False
        # ),
        "env": attr.label(
            mandatory = False,
            doc = "Dictionary with enviroment variables"
        )
    },
    doc = """
Produces a package with given name using sbt build tool
""",
)
