{ config, pkgs, lib, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      histFile = "$HOME/.cache/zsh_history";
      interactiveShellInit = ''
        # ex - archive extractor
        ## usage: ex <file>
        ex ()
        {
          if [ -f $1 ] ; then
            case $1 in
              *.tar.bz2)	tar xjf $1
              ;;
              *.tar.gz)	tar xzf $1
              ;;
              *.tar.xz)	tar xJf $1
              ;;
              *.bz2)	bunzip2 $1
              ;;
              *.rar)	unrar x $1
              ;;
              *.gz)		gunzip $1
              ;;
              *.tar)	tar xf $1
              ;;
              *.tbz2)	tar xjf $1
              ;;
              *.tgz)	tar xzf $1
              ;;
              *.zip)	unzip $1
              ;;
              *.Z)		uncompress $1
              ;;
              *.7z)		7z x $1
              ;;
              *)		echo "'$1' cannot be extracted via ex()"
              ;;
            esac
          else
            echo "'$1' is not a valid file"
          fi
        }
      '';
      promptInit = ''eval "$(starship init zsh)"'';
    };
  };
}