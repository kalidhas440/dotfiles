if status is-interactive
    starship init fish | source
    zoxide init fish | source
    
    alias ls="lsd --icon=always --color=auto"
    
end
