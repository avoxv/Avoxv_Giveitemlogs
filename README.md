For support, scripts, and more. https://discord.gg/q4pCAqt34J

🟢 **Avoxv GiveItem Logs**

A simple FiveM ESX server-side command that allows admins to give items to players and automatically logs all actions to Discord via webhook.

Built for ESX Legacy (es_extended) servers.

📦 **Features**

✅ Admin-only /giveitem command

✅ Gives items directly to a player’s inventory

✅ Sends detailed logs to Discord

✅ Logs include:

- Admin name & server ID

- Admin license

- Target player name & ID

- Target license

- Item name

- Amount given

- Timestamp

🔧 **Requirements**

- Cfx.re FiveM Server

- ESX (es_extended)

📥 **Installation**

**1.** Place the Avoxv_Giveitemlogs script in your ``resources`` folder.
**2.** Add this to your ``server.cfg``:

ensure Avoxv_Giveitemlogs

**3.** Open the script and replace:

local webhook = "YOUR_DISCORD_WEBHOOK_URL"

With your actual Discord webhook URL.

**4.** Restart your server.

🖥️ **Usage**

Code:
/giveitem [id] [item] [amount]

This will:

- Give player ID 1 → Items

- Send a detailed log to Discord

🔐 **Permissions**

To grant permission in ``server.cfg``:

add_ace group.admin command.giveitem allow

📊 **Discord Log Preview**

The webhook sends an embed formatted like:

🟢 Avoxv Giveitem Logs

Admin: Name (ID)
Admin License: license:xxxxxxx

Target: Name (ID)
Target License: license:xxxxxxx

Item: Money
Amount: 250

With automatic timestamp in the footer.

🛠️ **Customization**

You can modify:

- Embed color
``65280`` → Change to any decimal color value

- Embed title
"🟢 Avoxv Giveitem Logs"

- Webhook username
"Avoxv GiveItem Logs"

⚠️ **Notes**

- Make sure the item exists in your ESX database.

- This script does not check item validity — invalid items may cause errors.

- Recommended to restrict usage to high-level staff only.


📜 **License**

Free to use and modify.
Do not resell as it's free.

📦 **Ace Permissions Configuration**

This resource allows you to configure which Ace Permission groups are allowed to access specific features in avoxv_giveitemlog script.

⚙️ **Configuration**

Edit the config.lua file and add your Ace permission groups inside the Config.AllowedGroups table.

Config = {}

-- Place Ace Perms groups below
Config.AllowedGroups = {
    "PUT_GROUP_HERE", 
    "PUT_GROUP_HERE"
}

🛠 **How It Works**

- The script checks if a player belongs to one of the groups listed in Config.AllowedGroups.
- If the player’s Ace permission group matches any entry in the table, they will be granted access.
- If not, access will be denied.

Config = {}

Config.AllowedGroups = {
    "admin",
    "moderator",
    "superadmin" -- Groups are Changeable
}

📌 **Notes**

- Make sure your Ace permissions are properly configured in your ``server.cfg``.

- Group names are case-sensitive.

- Do not leave ``"PUT_GROUP_HERE"`` in production — replace it with actual group names.
