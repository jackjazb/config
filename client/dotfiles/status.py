#!/usr/bin/env python
import re
import subprocess
from datetime import datetime

upower = subprocess.run(
    ["upower", "-i", "/org/freedesktop/UPower/devices/battery_BAT1"],
    stdout=subprocess.PIPE,
).stdout.decode("utf-8")


def get_key(upower: str, key: str) -> str:
    match = re.search(rf"{key}:\s*([a-z\d]+)", upower)
    if match:
        return match.group(1)
    return ""


percent = get_key(upower, "percentage")
state = get_key(upower, "state")

current_time: str = datetime.now().strftime("%H:%M")

print(f"🔋{percent}% [{state}] {current_time}")
