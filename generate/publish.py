import os
from get_pathplannerlib_dependencies import get_pathplannerlib_dependencies
from bazelrio_gentool.generate_json import generate_json


def main():
    SCRIPT_DIR = os.environ["BUILD_WORKSPACE_DIRECTORY"]
    registry_location = os.path.join(
        SCRIPT_DIR, "..", "..", "..", "bazel-central-registry"
    )

    group = get_pathplannerlib_dependencies()

    os.chdir(SCRIPT_DIR)
    generate_json(
        registry_location, group, module_json_template=None, module_template=None
    )


if __name__ == "__main__":
    main()