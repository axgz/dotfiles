local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

local REPOS_DIR = wezterm.home_dir .. "/repos"


local leader_active = false


wezterm.on('update-right-status', function(window, pane)
    local is_leader = window:leader_is_active()
    -- Only update if state changed to avoid redundant renders
    if is_leader ~= leader_active then
        leader_active = is_leader
        -- Force a UI refresh so the tab title updates immediately
        window:perform_action(wezterm.action.EmitEvent('leader-state-changed'), pane)
    end
end)

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = pane.current_working_dir and pane.current_working_dir.file_path or pane.title

    -- Choose symbol based on state
    local symbol = leader_active and '● ' or '○ '

    -- Optional: Color the symbol differently when active
    local fg_color = leader_active and '#ff5555' or '#888888'

    return {
        { Foreground = { Color = fg_color } },
        { Text = symbol },
        { Foreground = { Color = config.colors and config.colors.tab_bar and config.colors.tab_bar.active_tab and config.colors.tab_bar.active_tab.fg_color or '#cccccc' } },
        { Text = ' ' .. title .. ' ' },
    }
end)

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
    local act = wezterm.action
    local mux = wezterm.mux

    return act.InputSelector {
        title = 'Select project',
        fuzzy = true,
        fuzzy_description = 'Search: ',
        choices = get_project_choices(),
        action = wezterm.action_callback(function(window, pane, id, label)
            -- Guard clause: exit early if no ID is selected
            if not id then
                return
            end

            if not label then
                return
            end

            -- Using Lua String Interpolation (requires Lua 5.4+)
            -- local cmd =
            --    'wezterm cli spawn tab --cwd "' .. id .. '" -- bash && ' ..
            --    'wezterm cli spawn tab --cwd "' .. id .. '" -- bash -c "github copilot" && ' ..
            --    'nvim || exec bash'
            --window:perform_action(act.SpawnCommandInNewWindow({
            --   cwd = id,
            --   args = { "bash", "-c", cmd },
            --   set_environment_variables = {
            --       WEZTERM_WORKSPACE = label,
            ---   },
            -- }), pane)
            --

            if workspace_exists(label) then
                window:perform_action(act.SwitchToWorkspace { name = label }, pane)
            end

            wezterm.time.call_after(0, function()
                local _, new_pane, _ = mux.spawn_window({
                    workspace = label,
                    cwd = id,
                    args = { 'nvim', '.' }
                })

                new_pane:tab():window():spawn_tab({
                    cwd = id,
                    args = { 'bash' }
                })

                window:perform_action(act.SwitchToWorkspace { name = label }, pane)
            end)
        end),
    }
end

local config = wezterm.config_builder()
-- CRITICAL: Enable Unix Domain for reliable tab/window spawning
config.unix_domains = {
    { name = 'unix' },
}
-- CRITICAL: Connect to the mux server on startup
config.set_environment_variables = {
    PATH = os.getenv("PATH"),
}
config.default_gui_startup_args = { 'connect', 'unix' }
config.front_end = "WebGpu"
config.enable_wayland = false
config.use_fancy_tab_bar = true
config.disable_default_key_bindings = true
config.leader = {
    key = 's',
    mods = 'CTRL',
    timeout_milliseconds = 1000,
}
config.keys = {
    { key = 's', mods = 'CTRL',   action = wezterm.action.DisableDefaultAssignment },
    { key = 'f', mods = 'LEADER', action = open_project() },
}
return config
