c.url.searchengines = {
    "DEFAULT": "https://google.com/search?hl=en&q={}",
    "!y": "https://www.youtube.com/results?search_query={}",
    "!gm": "https://mail.google.com/mail/u/0/#search/{}",
    "!m": "https://www.google.com/maps/search/{}",
    "!r": "https://www.reddit.com/search?q={}",
    "!a": "https://www.amazon.com/s?k={}",
    "!w": "https://en.wikipedia.org/wiki/{}",
    "!gh": "https://github.com/search?o=desc&q={}&s=stars",
    "!gi": "https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1",
}

config.bind("<Ctrl+Up>", "spawn --userscript video_speed.sh increase")
config.bind("<Ctrl+Down>", "spawn --userscript video_speed.sh decrease")
config.bind("<Ctrl+0>", "spawn --userscript video_speed.sh reset")
config.bind("H", "tab-prev")
config.bind("L", "tab-next")
config.bind("J", "back")
config.bind("K", "forward")

config.load_autoconfig()
