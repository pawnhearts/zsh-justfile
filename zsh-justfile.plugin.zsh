
function check_justfile() {


    if [[ -f justfile ]]; then
     egrep ':$' justfile|sed 's/\ .*//g'|sed 's/://g' | while read f; do
     alias $f="just $f"
    done

    fi


}

function enable_justfile() {
    autoload -Uz add-zsh-hook
    add-zsh-hook chpwd check_justfile
}


enable_justfile
check_justfile
