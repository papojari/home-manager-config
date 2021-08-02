{ config, pkgs, ... }:

{
  home.file.".config/swappy/config".text = ''
    [Default]
    save_dir=/data/$USER/Pictures/Screenshots
    save_filename_format=swappy-%Y-%m-%d-%H-%M-%S.png
    show_panel=false
    line_size=5
    text_size=20
    text_font=sans-serif
  '';
}
