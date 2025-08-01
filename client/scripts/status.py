#!/usr/bin/env python
import re
import subprocess
from datetime import datetime


def run(cmd: str) -> str | None:
    try:
        parts = cmd.split(" ")
        return subprocess.run(
            parts,
            stdout=subprocess.PIPE,
        ).stdout.decode("utf-8")
    except Exception:
        return None


def match(regex: str, input: str) -> str:
    match = re.search(regex, input)
    if match:
        return match.group(1)
    return ""


def get_key(upower: str, key: str) -> str:
    return match(rf"{key}:\s*([a-z\d]+)", upower)


def battery():
    upower = run("upower -i /org/freedesktop/UPower/devices/battery_BAT1")
    if upower is None:
        return "?"

    bat_percent = get_key(upower, "percentage")
    bat_status = get_key(upower, "state")

    bat_symbol = ""
    match bat_status:
        case "fully":
            bat_symbol = "✓"
        case "discharging":
            bat_symbol = "↓"
        case "charging":
            bat_symbol = "↑"
    return f"🔋{bat_percent}% {bat_symbol}"


def time():
    return datetime.now().strftime("%H:%M")


def network():
    iwconfig = run("iwconfig")
    if iwconfig is None:
        return "🛜 ?"

    quality = match(r"Link Quality=([\d/]+)", iwconfig)
    parts = quality.split("/")
    pct = int(parts[0]) / int(parts[1])
    dots = int(5 * pct)
    status = ("●" * dots) + "○" * (5 - dots)
    return f"🛜 {status}"


order = [battery(), network(), time(), "🧙‍♂️"]
print(f"{' / '.join(order)}")
