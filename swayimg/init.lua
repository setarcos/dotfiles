-- Bind Shift+Delete to delete the current file from disk
swayimg.viewer.on_key("Shift-Delete", function()
    local image = swayimg.viewer.get_image()
    if image ~= nil then
        -- Permanently remove the file from disk
        local success, err = os.remove(image.path)
        if success then
            swayimg.text.status = "Deleted: " .. image.path
        else
            swayimg.text.status = "Error: " .. err
        end
    end
end)

-- Quit the application
local function quit()
    swayimg.exit()
end

-- Bind q to quit in every mode (bindings are per mode)
swayimg.viewer.on_key("q", quit)
swayimg.gallery.on_key("q", quit)
swayimg.slideshow.on_key("q", quit)
