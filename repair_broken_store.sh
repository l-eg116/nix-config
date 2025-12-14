# Perform garbage collection
nix-collect-garbage -d
# Repair nix store
sudo nix-store --verify --check-contents --repair
