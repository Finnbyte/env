local gears                         = require("gears")
local lain                          = require("lain")
local awful                         = require("awful")
local wibox                         = require("wibox")
local dpi                           = require("beautiful.xresources").apply_dpi

local os                            = require("os")
local my_table                      = awful.util.table or gears.table -- 4.{0,1} compatibility
local font_name                     = "CaskaydiaCoveNerdFontMono"

local theme                         = {}
theme.default_dir                   = require("awful.util").get_themes_dir() .. "default"
theme.wallpaper                     = os.getenv("WALLPAPERS_DIR") .. "/misc/moon1.png"
theme.font                          = font_name .. " 11"
theme.fg_normal                     = "#9E9E9E"
theme.fg_focus                      = "#EBEBFF"
theme.bg_normal                     = "#242424"
theme.bg_focus                      = "#242424"
theme.fg_urgent                     = "#000000"
theme.bg_urgent                     = "#FFFFFF"
theme.border_width                  = dpi(1)
theme.border_normal                 = "#242424"
theme.border_focus                  = "#EBEBFF"
theme.taglist_fg_focus              = "#EDEFFF"
theme.taglist_bg_focus              = "#242424"
theme.menu_height                   = dpi(16)
theme.menu_width                    = dpi(140)
theme.ocol                          = "<span color='" .. theme.fg_normal .. "'>"
theme.tasklist_sticky               = theme.ocol .. "[S]</span>"
theme.tasklist_ontop                = theme.ocol .. "[T]</span>"
theme.tasklist_floating             = theme.ocol .. "[F]</span>"
theme.tasklist_maximized_horizontal = theme.ocol .. "[M] </span>"
theme.tasklist_maximized_vertical   = ""
theme.tasklist_disable_icon         = true
-- theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
-- theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
-- theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
-- theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.useless_gap                   = dpi(6)
theme.layout_txt_tile               = "[t]"
theme.layout_txt_tileleft           = "[l]"
theme.layout_txt_tilebottom         = "[b]"
theme.layout_txt_tiletop            = "[tt]"
theme.layout_txt_fairv              = "[fv]"
theme.layout_txt_fairh              = "[fh]"
theme.layout_txt_spiral             = "[s]"
theme.layout_txt_dwindle            = "[d]"
theme.layout_txt_max                = "[m]"
theme.layout_txt_fullscreen         = "[F]"
theme.layout_txt_magnifier          = "[M]"
theme.layout_txt_floating           = "[*]"

-- lain related
theme.layout_txt_cascade            = "[cascade]"
theme.layout_txt_cascadetile        = "[cascadetile]"
theme.layout_txt_centerwork         = "[centerwork]"
theme.layout_txt_termfair           = "[termfair]"
theme.layout_txt_centerfair         = "[centerfair]"

local markup                        = lain.util.markup
local white                         = theme.fg_focus
local gray                          = theme.fg_normal

-- Menu
local myawesomemenu                 = {
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart",     awesome.restart },
    { "lock",        function() awful.spawn("slock") end },
    { "quit",        function() awesome.quit() end },
}

-- local mymainmenu                                = awful.menu({
--     items = { { "awesome", myawesomemenu, theme.awesome_icon },
--         { "open terminal", terminal }
--     }
-- })
--
-- local mylauncher                                = awful.widget.launcher({
--     -- image = theme.awesome_icon,
--     menu = mymainmenu
-- })
--
-- Textclock
local mytextclock                   = wibox.widget.textclock(markup(white, " %H:%M - %a, %d %b %Y"))
mytextclock.font                    = theme.font

-- Calendar
theme.cal                           = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = font_name .. " 11",
        fg   = white,
        bg   = theme.bg_normal
    }
})

-- Mail IMAP check
--[[ commented because it needs to be set before use
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        mail_notification_preset.fg = white

        mail  = ""
        count = ""

        if mailcount > 0 then
            mail = "Mail "
            count = mailcount .. " "
        end

        widget:set_markup(markup.font(theme.font, markup(gray, mail) .. markup(white, count)))
    end
})
--]]

-- -- MPD
-- theme.mpd = lain.widget.mpd({
--     settings = function()
--         mpd_notification_preset.fg = white
--
--         artist                     = mpd_now.artist .. " "
--         title                      = mpd_now.title .. " "
--
--         if mpd_now.state == "pause" then
--             artist = "mpd "
--             title  = "paused "
--         elseif mpd_now.state == "stop" then
--             artist = ""
--             title  = ""
--         end
--
--         widget:set_markup(markup.font(theme.font, markup(gray, artist) .. markup(white, title)))
--     end
-- })

-- /home fs
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = white, bg = theme.bg_normal, font = "Terminus 10.5" },
    settings  = function()
        local fs_header, fs_p = "", ""

        if fs_now["/home"].percentage >= 90 then
            fs_header = " Hdd "
            fs_p      = fs_now["/home"].percentage
        end

        widget:set_markup(markup.font(theme.font, markup(gray, fs_header) .. markup(white, fs_p)))
    end
})
--]]

-- CPU
local cpu = lain.widget.sysload({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup(gray, " CPU ") .. load_1 .. " "))
    end
})

-- MEM
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup(gray, " MEM ") .. mem_now.used .. " "))
    end
})

-- /home fs
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    partition = "/home",
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10.5" },
})
--]]

-- Battery
local bat = lain.widget.bat({
    settings = function()
        local perc = bat_now.perc
        if bat_now.ac_status == 1 then perc = perc .. " Plug" end
        widget:set_markup(markup.font(theme.font, markup(gray, " BAT ") .. perc .. " "))
    end
})

-- Net checker
local net = lain.widget.net({
    settings = function()
        if net_now.state == "up" then
            net_state = "On"
        else
            net_state = "Off"
        end
        widget:set_markup(markup.font(theme.font, markup(gray, " NET ") .. net_state .. " "))
    end
})


-- Weather
theme.weather = lain.widget.weather({
    city_id = 633680, -- placeholder (London)
    notification_preset = { font = theme.font, fg = white }
})
--
-- -- Separators
local first   = wibox.widget.textbox(markup.font(font_name .. " 4", " "))
local spr     = wibox.widget.textbox(' ')

local function update_txt_layoutbox(s)
    -- Writes a string representation of the current layout in a textbox widget
    local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
    s.mytxtlayoutbox:set_text(txt_l)
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    -- awful.tag(awful.util.tagnames, s, awful.layout.layouts)
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Textual layoutbox
    s.mytxtlayoutbox = wibox.widget.textbox(theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
    awful.tag.attached_connect_signal(s, "property::selected", function() update_txt_layoutbox(s) end)
    awful.tag.attached_connect_signal(s, "property::layout", function() update_txt_layoutbox(s) end)
    s.mytxtlayoutbox:buttons(my_table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 2, function() awful.layout.set(awful.layout.layouts[1]) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    -- s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = gears.table.join(
            awful.button({}, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
            awful.button({}, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end),
            awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
            awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
        )
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.focused)

    -- Create the wibox and add widgets to it
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(18), bg = theme.bg_normal, fg = theme.fg_normal })
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            first,
            s.mytaglist,
            spr,
            s.mytxtlayoutbox,
            spr,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        {             -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            spr,
            -- theme.mpd.widget,
            --theme.mail.widget,
            --theme.fs.widget,
            cpu.widget,
            mem.widget,
            bat.widget,
            net.widget,
            theme.weather,
            mytextclock,
            -- mylauncher,
        },
    }
end

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
