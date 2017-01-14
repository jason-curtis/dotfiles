function toxic
    echo "watching files and running tox..."
    tox -- $argv
    watchmedo shell-command --patterns="*.py;*.ini;*.pyi" --ignore-pattern="*.tox/*" --recursive --command "clear && tox -- $argv" --drop
end
