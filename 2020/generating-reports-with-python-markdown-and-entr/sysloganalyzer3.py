#!/usr/bin/env python3
import re
import sys

from collections import namedtuple, Counter
from datetime import datetime, timedelta
from itertools import groupby


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


def round_date(date):
    return date.replace(minute=(date.minute // 5) * 5, second=0, microsecond=0)


def main():
    entries = list(parse_log())

    app_message_count = Counter(x.app for x in entries)

    print("Messages per app")
    for app, count in sorted(app_message_count.items(), key=lambda x: -x[1]):
        print(f"- {app}: {count}")

    print("Latest entries")
    min_date = datetime.now() - timedelta(minutes=30)
    latest_entries = (x for x in entries if x.date > min_date)
    latest_entries = sorted(latest_entries,
                            key=lambda x: (x.app, x.date))
    for app, entries in groupby(latest_entries, lambda x: x.app):
        print(f"- {app}")
        for entry in entries:
            print(f"    {entry.date}, {entry.message}")


if __name__ == "__main__":
    main()
