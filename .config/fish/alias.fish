# Git related 
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gc="git commit -m"

# Paths related
alias ..="cd ../"
alias ...="cd ../.."
alias ....="cd ../../.."

alias ll="ls -Al"

# Nvim related
alias vi="nv"
alias vim="nv"

function nv --wraps nvim 
    if [ (count $argv) -lt 1 ];
        if [ -d ./src/ ]; nvim ./src/
        else; nvim .
        end
    else; nvim $argv
    end
end

