#!/usr/bin/env python3
import re
import sys

from collections import namedtuple
from datetime import datetime


LOG_RE = re.compile(r"(?P<date>\w+ \d+ \d+:\d+:\d+)"
                    r" \w+"  # the hostname, we ignore it
                    r" (?P<app>[-a-zA-Z.]+)"
                    r" *[^:]*:"  # ignore any process identifier
                    r" (?P<message>.*)")


Entry = namedtuple("Entry", ("date", "app", "message"))

YEAR = datetime.now().year


def parse_line(line):
    match = LOG_RE.match(line)
    if not match:
        return None
    date_str = match.group("date")
    date = datetime.strptime(date_str, "%b %d %H:%M:%S")
    date = date.replace(year=YEAR)
    return Entry(date=date,
                 app=match.group("app"),
                 message=match.group("message"))


def parse_log():
    for line in sys.stdin.readlines():
        entry = parse_line(line)
        if entry:
            yield entry


def main():
    for entry in parse_log():
        print(entry)


if __name__ == "__main__":
    main()
