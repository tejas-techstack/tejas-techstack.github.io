# ===== CONFIG =====
USER="tejas-techstack"
SITE_DIR="/home/tejasr/Tejas_PERSONAL/sem6/slides/cd/cd_site"
# ==================

REPO="$USER.github.io"

cd "$SITE_DIR" || exit 1

gh auth login

git init
git add .
git commit -m "initial deploy"
git branch -M main

gh repo create "$REPO" \
  --public \
  --source=. \
  --remote=origin \
  --push

gh api \
  -X POST \
  repos/$USER/$REPO/pages \
  -f source[branch]=main \
  -f source[path]=/

echo "Published:"
echo "https://$USER.github.io/"
