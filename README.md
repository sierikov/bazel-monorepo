# Bazel Monorepo

Demo repository for testing Bazel docker features.

## Build

### All

To build all targets run:

```bash
bazel build //...
```

> Note: You probably will recive *DEBUG* message with deprecation note. [This issue is already known.](https://github.com/oswee/prime/issues/85)

### One target

To build specific target run:

```bash
bazel build //<package>:<name_of_target>
```

For examle `bazel build //java:java_jar`.

## Docker

Some packages contains *docker* targets.
Normally it is manage by Bazel `docker_push`, so `bazel-bin` contains
only layer infromation about target.

### With own hands

If you wan to recive **full docker image**, that you can later import
with help of `docker` - you need to request it explicitly with
`.tar` ending, like below:

```bash
bazel build //<package>:<name_of_target_docker>.tar
```

Then you can load this image form `bazel-bin/<package>/<name_of_target_docker>.tar` into docker with following command:

```bash
docker load -i bazel-bin/<package>/<name_of_target_docker>.tar
```

## Reference

### Docs

- [Bazel Build Reference](https://docs.bazel.build/versions/master/build-ref.html)

### Rules

- [Java Rules](https://docs.bazel.build/versions/master/be/java.html)
- [Docker Rules](https://github.com/bazelbuild/rules_docker)
