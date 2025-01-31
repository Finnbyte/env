local gears = require("gears")
local os = require("os")

-- Returns home directory with slash at the end
function get_home_dir()
    return os.getenv("HOME") .. "/"
end

-- Returns directory for wallpapers with slash at the end
function get_wallpapers_dir()
    return os.getenv("WALLPAPERS_DIR") .. "/"
end
