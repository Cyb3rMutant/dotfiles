local HERE = os.getenv("HOME") .. "/.config/hypr"
local SCRIPTS = HERE .. "/scripts"

------------------------------------------------------------------------------------------
-- require() caches this table, so every file gets the same one

local v = {
	HERE = HERE,
	SCRIPTS = SCRIPTS,

	LOCK = SCRIPTS .. "/lock",
}

return v
