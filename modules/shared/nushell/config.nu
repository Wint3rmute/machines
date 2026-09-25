$env.config.buffer_editor = 'helix';
$env.config.edit_mode = 'vi';

$env.PATH = $env.PATH ++ [
  "/run/current-system/sw/bin",
  "/nix/var/nix/profiles/default/bin",
  "/Users/wint3rmute/.nix-profile/bin",
  "/etc/profiles/per-user/wint3rmute/bin",
  "~/.local/bin",
  "~/.cargo/bin",
];

# Disables the startup banner
$env.config.show_banner = false

$env.EDITOR = "hx"

# Helper functions to get branch names
def git_main_branch [] {
    let branches = (git branch -r | lines | str trim)
    if ($branches | any {|b| $b =~ "origin/main"}) {
        "main"
    } else if ($branches | any {|b| $b =~ "origin/master"}) {
        "master"
    } else {
        "main"
    }
}

def git_develop_branch [] {
    let branches = (git branch -r | lines | str trim)
    if ($branches | any {|b| $b =~ "origin/develop"}) {
        "develop"
    } else {
        "dev"
    }
}

def git_current_branch [] {
    git rev-parse --abbrev-ref HEAD
}

alias j = just

# Basic commands
alias g = git
alias ga = git add
alias gaa = git add --all
alias gapa = git add --patch
alias gau = git add --update
alias gco = git checkout
alias gcb = git checkout -b
alias gcm = git checkout (git_main_branch)
alias gcd = git checkout (git_develop_branch)

# Commit commands
alias gc = git commit --verbose
alias gca = git commit --verbose --all
alias gcam = git commit --all --message
alias gcmsg = git commit --message
alias "gc!" = git commit --verbose --amend
alias "gcan!" = git commit --verbose --all --no-edit --amend
alias gcf = git commit --fixup

# Branch commands
alias gb = git branch
alias gba = git branch --all
alias gbd = git branch --delete
alias gbD = git branch --delete --force
alias gbm = git branch --move
alias ggsup = git branch --set-upstream-to=origin/(git_current_branch)

# Switch commands
alias gsw = git switch
alias gswc = git switch -c

# Push & Pull commands
alias gl = git pull
alias gp = git push
alias gpr = git pull --rebase
alias gpra = git pull --rebase --autostash
alias gpf = git push --force-with-lease
alias gpsup = git push --set-upstream origin (git_current_branch)
alias ggp = git push origin (git_current_branch)
alias ggl = git pull origin (git_current_branch)

# Log & Diff commands
alias glog = git log --oneline --decorate --graph
alias gloga = git log --oneline --decorate --graph --all
alias glol = git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'
alias gd = git diff
alias gdca = git diff --cached
alias gdw = git diff --word-diff

# Status & Stash commands
alias gst = git status
alias gss = git status --short
alias gsta = git stash push
alias gsts = git stash show --patch

# Merge & Rebase commands
alias grb = git rebase
alias grbi = git rebase --interactive
alias grbc = git rebase --continue
alias grba = git rebase --abort
alias gm = git merge
alias gma = git merge --abort
alias gms = git merge --squash
alias gmff = git merge --ff-only

# Other useful shortcuts
alias gf = git fetch
alias gfa = git fetch --all --tags --prune
alias gcp = git cherry-pick
alias make = just

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_MULTILINE_INDICATOR = "::: "

source ~/.config/zoxide.nu
