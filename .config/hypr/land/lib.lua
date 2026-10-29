-- replacements for hyprlang's exec-once / exec
local M = {}

-- run once when hyprland starts (old exec-once)
function M.exec_once(cmd)
    hl.on("hyprland.start", function() hl.exec_cmd(cmd) end)
end

-- run on start and again on every config reload (old exec)
function M.exec(cmd)
    local run = function() hl.exec_cmd(cmd) end
    hl.on("hyprland.start", run)
    hl.on("config.reloaded", run)
end

return M
