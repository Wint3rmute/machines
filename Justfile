is_fedora := if path_exists("/etc/fedora-release") == "true" { "true" } else { "false" }
rebuild := if os() == "macos" { "darwin-rebuild" } else if is_fedora == "true" { "home-manager" } else { "nixos-rebuild" }
flake := if is_fedora == "true" { ".#wint3rmute@fedora" } else { "." }
sudo := if is_fedora == "true" { "" } else { "sudo " }


default: fmt check flake build switch commit garbage

alias f := fmt
alias s := switch
alias b := build
alias c := check
alias g := garbage

fmt:
    nix fmt .

flake:
    nix flake update

check:
    nix flake check --all-systems && statix check && deadnix

build:
    {{rebuild}} build --flake {{flake}}

switch:
    {{sudo}}{{rebuild}} switch --flake {{flake}}

commit:
    git add -A && git commit -m flake && git push

garbage:
    {{sudo}} nix-collect-garbage -d
