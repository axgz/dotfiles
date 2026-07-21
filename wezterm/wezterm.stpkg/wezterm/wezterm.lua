local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ::::::::::::::::::::::::::::::::::: --
-- Variables user can change
-- ::::::::::::::::::::::::::::::::::: --

local REPOS_DIR = wezterm.home_dir .. "/repos"
local LEADER_ACTIVE = '●'
local LEADER_INACTIVE = '○'

-- ::::::::::::::::::::::::::::::::::: --
-- Behaviour
-- ::::::::::::::::::::::::::::::::::: --

config.max_fps = 240
config.animation_fps = 240
config.window_decorations = "NONE"
config.enable_scroll_bar = false

-- ::::::::::::::::::::::::::::::::::: --
-- Appearance
-- ::::::::::::::::::::::::::::::::::: --

-- Font
config.font = wezterm.font('CommitMono Nerd Font', { weight = 'Regular' })
config.font_size = 14.0 -- Adjust to your preference

-- Boarder
config.window_frame = {
    border_left_width = 20,
    border_right_width = 20,
    border_bottom_height = 10,
    border_top_height = 20,
    -- border_left_color = "#fff123",
    -- border_right_color = "#fff123",
    -- border_bottom_color = "#fff123",
    -- border_top_color = "#fff000",
}

-- Padding
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- Tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false

-- Leader active indicator
wezterm.on("update-status",
    function(window, _)
        -- local workspace = window:active_workspace() .. wezterm.nerdfonts.pl_left_hard_divider
        local workspace = window:active_workspace() .. ' >'
        if workspace == 'default >' then
            workspace = ''
        end
        local prefix = " " .. LEADER_INACTIVE .. " "
        if window:leader_is_active() then
            prefix = " " .. LEADER_ACTIVE .. " "
        end
        window:set_left_status(wezterm.format {
            { Text = prefix },
            { Text = workspace }
        })
    end
)

-- Tab title helper
local function tab_title(tab)
    local pane = tab.active_pane
    local proc_name = pane.foreground_process_name
    local title = 'shell'
    if proc_name and #proc_name > 0 then
        title = string.gsub(proc_name, '(.*[/\\])(.*)', '%2')
    end
    return title
end

-- Tab title
wezterm.on("format-tab-title",
    function(tab, tabs, panes, config, hover, max_width)
        local title = " " .. tab.tab_index + 1 .. ": " .. tab_title(tab) .. " "
        return {
            { Text = title }
        }
    end
)

-- ::::::::::::::::::::::::::::::::::: --
-- Project launcher
-- ::::::::::::::::::::::::::::::::::: --

local function get_project_choices()
    local choices = {}
    local handle = io.popen('find ' .. REPOS_DIR .. ' -maxdepth 1 -mindepth 1 -type d')
    if not handle then
        return choices
    end
    for path in handle:lines() do
        local label = path:match("([^/]+)$")
        if label then
            table.insert(choices, { id = path, label = label })
        end
    end
    table.insert(choices, { id = "default", label = "default" })
    handle:close()
    return choices
end

local function workspace_exists(name)
    for _, ws_name in ipairs(wezterm.mux.get_workspace_names()) do
        if ws_name == name then
            return true
        end
    end
    return false
end

local function open_project()
    return wezterm.action.InputSelector {
        title = 'fuzzy',
        fuzzy = true,
        fuzzy_description = 'Search: ',
        choices = get_project_choices(),
        action = wezterm.action_callback(function(window, pane, id, label)
            if not id then return end
            if not label then return end

            if workspace_exists(label) then
                window:perform_action(wezterm.action.SwitchToWorkspace { name = label }, pane)
                return
            end

            wezterm.time.call_after(0, function()
                local _, new_pane, _ = wezterm.mux.spawn_window({
                    workspace = label,
                    title = 'nvim',
                    cwd = id,
                    args = { 'nvim', '.' },
                })

                new_pane:tab():window():spawn_tab({
                    title = 'bash',
                    cwd = id,
                    args = { 'bash' }
                })

                window:perform_action(wezterm.action.SwitchToWorkspace { name = label }, pane)
            end)
        end),
    }
end

-- ::::::::::::::::::::::::::::::::::: --
-- Multiplexing
-- ::::::::::::::::::::::::::::::::::: --

config.unix_domains = {
    { name = 'unix' }
}
config.default_gui_startup_args = { 'connect', 'unix' }

-- ::::::::::::::::::::::::::::::::::: --
-- Troubleshooting
-- ::::::::::::::::::::::::::::::::::: --

--config.front_end = "WebGpu"
--config.enable_wayland = false
--config.disable_default_key_bindings = true
--config.set_environment_variables = { PATH = os.getenv("PATH") }

-- ::::::::::::::::::::::::::::::::::: --
-- Bindings
-- ::::::::::::::::::::::::::::::::::: --

config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 2000 }

config.keys = {
    { key = 's', mods = 'CTRL',   action = wezterm.action.DisableDefaultAssignment },
    { key = 's', mods = 'LEADER', action = open_project() },
    { key = 'd', mods = 'LEADER', action = wezterm.action.DetachDomain { DomainName = 'unix' } },
    { key = 'c', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
    { key = 'x', mods = 'LEADER', action = wezterm.action.CloseCurrentTab { confirm = false } },
}

-- Use leader + number to activate that tab
for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "ALT",
        action = wezterm.action.ActivateTab(i - 1),
    })
end
table.insert(config.keys, {
    key = tostring(0),
    mods = "ALT",
    action = wezterm.action.ActivateTab(10 - 1),
})

return config
