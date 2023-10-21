from get_pathplannerlib_dependencies import get_pathplannerlib_dependencies


def main():
    group = get_pathplannerlib_dependencies()
    print(group.version)


if __name__ == "__main__":
    main()
