# pidgin-nix

A flake for pidgin and it's plugins, as they were removed from nixpkgs due to depending on really old libraries.

Available packages:

```
pidgin
pidginPackages.
  pidign-carbons
  pidgin-indicator
  pidgin-latex
  pidgin-opensteamworks
  pidgin-libnotify
  pidgin-osd
  pidgin-otr
  pidgin-sipe
  pidgin-window-merge
  pidgin-xmpp-receipts
  purple-discord
  purple-facebook (broken)
  purple-googlechat
  purple-lurch
  purple-matrix (removed)
  purple-mm-sms
  purple-plugin-pack (broken)
  purple-slack
  purple-vk-plugin (broken)
  purple-xmpp-http-upload
  tdlib-purple
```

# `pidgin`

Works fine. Out of all built-in protocols I only use XMPP, and it works well.

# `tdlib-purple` (Telegram)

Supports DMs, chats and channels (they appear as chats) and Secret Chats. You can send text, images, videos, and do some formatting. Does not support advanced telegram features, like polls.

# `purple-discord` (Discord)

Works fine. Supports 2FA, DMs, groups and servers, but doesn't support voice chat.

# `purple-lurch` (XMPP end-to-end encryption)

Loads into pidgin, but breaks a lot (seems like a general problem with OMEMO).

# `pidgin-libnotify` (Notifications)

Works fine. Though on my setup clicking on the notification does not focus the app.

# `pidgin-indicator` (Tray icon)

Works, but the icon is blank.

# `pidgin-window-merge`

Works fine.
