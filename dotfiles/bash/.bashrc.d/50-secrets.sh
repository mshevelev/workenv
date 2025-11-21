# Load personal environment variables (API keys, secrets, tokens)
if [ -f "$HOME/.config/secrets/env" ]; then
    . "$HOME/.config/secrets/env"
fi
