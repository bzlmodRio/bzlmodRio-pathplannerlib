load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_pathplannerlib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_pathplanner_lib_pathplannerlib_java",
        artifact = "com.pathplanner.lib:PathplannerLib-java:2025.0.0-beta-1.1",
        artifact_sha256 = "1de6a8c79dc105354139bae0e8478b5b0be7c2e0f8dfc21647b941028c804bdf",
        server_urls = ["https://3015rangerrobotics.github.io/pathplannerlib/repo"],
    )

def setup_legacy_bzlmodrio_pathplannerlib_java_dependencies():
    __setup_bzlmodrio_pathplannerlib_java_dependencies(None)

setup_bzlmodrio_pathplannerlib_java_dependencies = module_extension(
    __setup_bzlmodrio_pathplannerlib_java_dependencies,
)
