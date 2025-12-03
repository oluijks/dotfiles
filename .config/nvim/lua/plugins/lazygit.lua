-- lua/plugins/lazygit.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local M = {}

function M.setup()
    -- Optional: configure integration with Telescope if you want
    local ok_telescope, telescope = pcall(require, "telescope")
    if ok_telescope then
        telescope.load_extension("lazygit")
    end
end

return M
