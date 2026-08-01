-- Bind Shift+Delete to delete the current file from disk
swayimg.viewer.on_key("Shift-Delete", function()
    local image = swayimg.viewer.get_image()
    if image ~= nil then
        -- Permanently remove the file from disk
        local success, err = os.remove(image.path)
        if success then
            swayimg.text.set_status("Deleted: " .. image.path)
        else
            swayimg.text.set_status("Error: " .. err)
        end
    end
end)
