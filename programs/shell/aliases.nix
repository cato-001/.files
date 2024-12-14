{
  g="git";
  gc="git commit";
  gaa="git add --all; git status";
  gst="git status";
  gl="git pull";
  gp="git push";
  gco="git checkout";

  c="cargo";
  cr="cargo run --";
  cb="cargo build";
  ck="cargo check";
  ca="cargo add";
  ci="cargo install";
  cu="cargo update";
  cpub="cargo publish";
  cn="cargo new";
  cini="cargo init";

  dc="docker compose";
  dcex="docker compose exec";
  dcup="docker compose up -d";
  dcpup = "docker compose pull; docker compose up -d";

  v="nvim-open";
  vim="nvim";
  today="nvim +Today";

  whichv="which $1 | xargs nvim";

  py="python3";

  fb="featurebranches";
  fbrb="fb-rebuild";
  fbup="fb-up";
  fbrm="fb-rm";
  fbdns="fb dns-status | rg $1 --color never | rg $2 --color never";
  fbst = "fb status | rg \"$1|Host|\+|\| Featurebranch\" --color never";

  redis="docker compose exec redis redis-cli";

  j="z";

  ls="eza";
  ll="eza -l";
  la="eza -lag";

  lf="fd . -t f";

  cat="bat";
}
