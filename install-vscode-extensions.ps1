# Make sure the 'code' CLI is available
if (-not (Get-Command "code" -ErrorAction SilentlyContinue)) {
    Write-Host "❌ VS Code 'code' CLI not found. Please ensure it's installed and added to PATH." -ForegroundColor Red
    exit
}

# List of VS Code extensions
$extensions = @(
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

# Loop through each extension and install it
foreach ($extension in $extensions) {
    Write-Host "Installing $extension..." -ForegroundColor Cyan
    code --install-extension $extension --force
}

Write-Host "`n✅ All extensions installed." -ForegroundColor Green
