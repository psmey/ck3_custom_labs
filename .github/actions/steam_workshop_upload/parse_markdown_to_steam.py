# pylint: disable=missing-function-docstring, missing-module-docstring
# https://steamcommunity.com/comment/Guide/formattinghelp

import sys

line_text_formatting = {
    "#": ("[h1]", "[/h1]"),
    "##": ("[h2]", "[/h2]"),
    "###": ("[h3]", "[/h3]"),
}

inline_text_formatting = {
    "**": ("[b]", "[/b]"),
    "__": ("[b]", "[/b]"),
}


def parse_text(text: str, replaced_chars: str, first_occurence: bool) -> str:
    if replaced_chars in text:
        replacement_string = "[b]" if first_occurence else "[/b]"
        text = text.replace(replaced_chars, replacement_string, 1)
        return parse_text(text, replaced_chars, not first_occurence)
    return text


def parse_markdown_to_steam(file_path: str) -> str:
    with open(file_path, "r", encoding="utf-8") as file:
        content: str = file.read()
    content = parse_text(content, "**", True)
    print(content)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage:")
        print("    python parse_markdown_to_steam.py <path/to/file.md>")
        sys.exit(1)
    sys_arg_file_path = sys.argv[1]
    parse_markdown_to_steam(sys_arg_file_path)
