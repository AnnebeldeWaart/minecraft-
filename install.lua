local url = "https://raw.githubusercontent.com/AnnebeldeWaart/minecraft-/main/chest_monitor.lua"
local response = http.get(url)

if response then
    local script = response.readAll()
    response.close()

    local file = fs.open("chest_monitor.lua", "w")
    file.write(script)
    file.close()

    print("Script downloaded and saved as chest_monitor.lua")
else
    print("Failed to download the script.")
end
