local ESX = exports["es_extended"]:getSharedObject()

-- 🔗 PUT YOUR WEBHOOK HERE
local webhook = "YOUR_DISCORD_WEBHOOK_URL"

-- 🔹 Discord function
local function SendToDiscord(title, message, color)
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        username = "GiveItem Logs",
        embeds = {{
            title = title,
            description = message,
            color = color,
            footer = {
                text = os.date("%Y-%m-%d %H:%M:%S")
            }
        }}
    }), { ['Content-Type'] = 'application/json' })
end

RegisterCommand("giveitem", function(source, args)
    local src = source
    local targetId = tonumber(args[1])
    local item = args[2]
    local amount = tonumber(args[3])

    if not targetId or not item or not amount then
        TriggerClientEvent('esx:showNotification', src, "Usage: /giveitem [id] [item] [amount]")
        return
    end

    local xPlayer = ESX.GetPlayerFromId(targetId)
    if not xPlayer then
        TriggerClientEvent('esx:showNotification', src, "Player not found")
        return
    end

    -- Give item
    xPlayer.addInventoryItem(item, amount)

    -- Get player info
    local adminName = GetPlayerName(src)
    local targetName = GetPlayerName(targetId)

    -- Get identifiers
    local adminIdentifiers = GetPlayerIdentifiers(src)
    local targetIdentifiers = GetPlayerIdentifiers(targetId)

    local adminLicense = adminIdentifiers[1] or "N/A"
    local targetLicense = targetIdentifiers[1] or "N/A"

    local logMessage = string.format(
        "**Admin:** %s (ID: %s)\n**Admin License:** %s\n\n**Target:** %s (ID: %s)\n**Target License:** %s\n\n**Item:** %s\n**Amount:** %s",
        adminName, src, adminLicense,
        targetName, targetId, targetLicense,
        item, amount
    )

    SendToDiscord("🟢 Avoxv Giveitem Logs", logMessage, 65280)

    TriggerClientEvent('esx:showNotification', src, "Item given successfully")
end, true)