#!/bin/bash

# VS Code extension list
extensions=(
  "aaron-bond.better-comments"
  "bierner.colorize"
  "dbaeumer.vscode-eslint"
  "donjayamanne.githistory"
  "DotJoshJohnson.xml"
  "esbenp.prettier-vscode"
  "formulahendry.auto-close-tag"
  "formulahendry.auto-rename-tag"
  "github.copilot"
  "github.copilot-chat"
  "github.vscode-pull-request-github"
  "johnpapa.vscode-peacock"
  "ms-azuretools.vscode-docker"
  "ms-dotnettools.csharp"
  "ms-dotnettools.csdevkit"
  "ms-python.python"
  "ms-python.vscode-pylance"
  "ms-vscode-remote.remote-ssh"
  "ms-vscode-remote.remote-wsl"
  "ms-vscode.remote-explorer"
  "ms-vscode.powershell"
  "naumovs.color-highlight"
  "PKief.material-icon-theme"
  "redhat.vscode-yaml"
  "richie5um2.vscode-sort-json"
  "VisualStudioExptTeam.vscodeintellicode"
  "VisualStudioExptTeam.intellicode-api-usage-examples"
  "wix.vscode-import-cost"
  "yzhang.markdown-all-in-one"
  "oderwat.indent-rainbow"
  "kisstkondoros.vscode-gutter-preview"
  "mrmlnc.vscode-duplicate"
  "yoavbls.pretty-ts-errors"
  "yandeu.five-server"
  "ecmel.vscode-html-css"
  "dsznajder.es7-react-js-snippets"
  "bradlc.vscode-tailwindcss"
  "mblode.pretty-formatter"
  "franswa.vscode-tailwindfold"
  "meganrogge.add-to-gitignore"
  "bierner.handlebars"
  "ms-vscode-remote.vscode-remote-extensionpack"
)

for extension in "${extensions[@]}"; do
  echo "Installing $extension..."
  code --install-extension "$extension" --force
done

echo "✅ All extensions installed."
