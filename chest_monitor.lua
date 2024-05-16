function print_inventory_on_monitor(chest, monitor)
    monitor.clear()

    local chest_inventory = chest.list()
    local monitor_width, monitor_height = monitor.getSize()

    local rows = math.floor(monitor_height / 2)
    local cols = 1

    local items_per_page = rows

    local start_row = math.floor((monitor_height - (items_per_page * 2)) / 2) + 1

    local row = start_row

    for slot, item in pairs(chest_inventory) do
        if row > (start_row + rows - 1) then
            break
        end

        local item_name = string.gsub(item.name, "minecraft:", "")

        local item_name_x = math.floor((monitor_width - #item_name) / 2)
        monitor.setCursorPos(item_name_x, row)
        monitor.setTextColor(colors.green)
        monitor.write(item_name)

        local item_count_x = math.floor((monitor_width - #tostring(item.count)) / 2)
        monitor.setCursorPos(item_count_x, row + 1)
        monitor.setTextColor(colors.gray)
        monitor.write(item.count)

        monitor.setTextColor(colors.white)

        row = row + 2
    end
end

while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("minecraft:chest")

    if monitor and chest then
        print_inventory_on_monitor(chest, monitor)
    else
        print("Error: Monitor or chest not found.")
    end

    sleep(10)
end
