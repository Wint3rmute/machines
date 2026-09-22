rebuild := if os() == "macos" { "darwin-rebuild" } else { "nixos-rebuild" }

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
    {{rebuild}} --flake . build

switch:
    sudo {{rebuild}} --flake . switch

commit:
    git add -A && git commit -m flake && git push

garbage:
    sudo nix-collect-garbage -d
