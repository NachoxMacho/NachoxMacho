# Starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Atuin
$env.ATUIN_NOBIND = true
atuin init nu | save -f ~/.local/share/atuin/init.nu #make sure you created the directory beforehand with `mkdir ~/.local/share/atuin/init.nu`
source ~/.local/share/atuin/init.nu

#bind to ctrl-r in emacs, vi_normal and vi_insert modes, add any other bindings you want here too
$env.config = (
    $env.config | upsert keybindings (
        $env.config.keybindings
        | append {
            name: atuin
            modifier: control
            keycode: char_r
            mode: [emacs, vi_normal, vi_insert]
            event: { send: executehostcommand cmd: (_atuin_search_cmd) }
        }
    )
)

# carapace-bin
source $"($nu.cache-dir)/carapace.nu"


# Aliases
alias k = kubectl

source "~/.cargo/env.nu"

$env.config.keybindings ++= [
    {
        name: sessionizer
        modifier: Control
        keycode: char_f
        mode: [emacs, vi_normal, vi_insert]
        event: { send: executehostcommand, cmd: "run-external tmux-sessionizer" }
    }
]

# Check if ssh-agent is already running
do --env {
    let ssh_agent_file = (
        $nu.temp-dir | path join $"ssh-agent-(whoami).nuon"
    )

    if ($ssh_agent_file | path exists) {
        let ssh_agent_env = open ($ssh_agent_file)
        if ($"/proc/($ssh_agent_env.SSH_AGENT_PID)" | path exists) {
            load-env $ssh_agent_env
            return
        } else {
            rm $ssh_agent_file
        }
    }

    let ssh_agent_env = ^ssh-agent -c
        | lines
        | first 2
        | parse "setenv {name} {value};"
        | transpose --header-row
        | into record
    load-env $ssh_agent_env
    $ssh_agent_env | save --force $ssh_agent_file
}
