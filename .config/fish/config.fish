#~/.config/fish/config.fish
# If you updated this file you probably want to re-run it.
function refish
    . ~/.config/fish/config.fish
end

set ENERGYSAVVY_DIR ~/energysavvy

# Switch to your energysavvy directory quickly
function es
    cd $ENERGYSAVVY_DIR/$argv
end

# Delete (likely stale) .pyc files
function killpycs
    find $ENERGYSAVVY_DIR -name \*.pyc -delete
end


## tox venvs
function te
    # Activate tox py3 venv, fall back on py2
    . .tox/py35/bin/activate.fish 2> /dev/null;
    or . .tox/py34/bin/activate.fish 2> /dev/null;
    or . .tox/py27/bin/activate.fish;
    or echo "couldn't find py35, 34 or py27 venv"
end

function te2
    # force py27
    . .tox/py27/bin/activate.fish
end

# Switch to directory and enter tox
function est
    es $argv;
    and te
end

function de
    deactivate
end

# For some reason the default in fish is ls -l
function ll
    ls -lash $argv
end

function devserver
    ssh -t -i ~/.vagrant.d/insecure_private_key -p 2222 vagrant@localhost
end

function djangoserver
    devserver sudo su - django
end

# If your first shell was MS-DOS
function cd..
    cd ..
end

## Mercurial
# get work done in a busy repository
function syncem
    hg fetch
    and hg push $argv
end
