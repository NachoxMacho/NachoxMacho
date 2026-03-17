def add-path --env [path: directory] {
    $env.PATH = ($env.PATH | split row (char esep) | prepend $path)
}

add-path $"($env.HOME)/.local/bin"

# Homebrew
add-path '/home/linuxbrew/.linuxbrew/bin'

# if pulumi
add-path $"($env.HOME)/.pulumi/bin"

# Go
add-path $"($env.HOME)/go/bin"
add-path $"/usr/local/go/bin"

# Cargo
add-path $"($env.HOME)/.cargo/bin"

# carapace-bin
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir $"($nu.cache-dir)"
carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"

$env.EDITOR = "nvim"
