# This file can be reloaded with :config-source within the browser.
c = c  # noqa: F821
config = config  # noqa: F821

config.load_autoconfig()

# Misc
c.auto_save.session = True

# Tabs
c.tabs.position = "top"
c.tabs.padding = {"top": 5, "bottom": 5, "left": 5, "right": 5}

# Fonts
c.fonts.default_size = "10pt"
c.fonts.default_family = "GeistMono NF"

# Binds
config.bind("<Ctrl-l>", "tab-next")
config.bind("<Ctrl-h>", "tab-prev")
config.bind("<Ctrl-f>", "cmd-set-text /")

# i3 has `Alt` so bind Ctrl-{1-8} to each tab.
for i in range(1, 8):
    config.bind(f"<Ctrl-{i}>", f"tab-focus {i}")
