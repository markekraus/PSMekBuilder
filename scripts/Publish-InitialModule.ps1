$ModuleName = 'PSMekBuilder'
$ProjectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$SrcFolder = Join-Path $ProjectRoot 'src'
$ModuleSrcPath = Join-Path $SrcFolder $ModuleName
$ModuleManifestFile = Join-Path $ModuleSrcPath "$ModuleName.psd1"
$APIKey = Read-Host -AsSecureString "PSGallery API Key"
Import-Module $ModuleManifestFile -Verbose -Force
$Params = @{
    Path = $ModuleSrcPath
    ProjectUri = "https://github.com/markekraus/PSMekBuilder"
    Repository = 'PSGallery'
    ReleaseNotes = "Placeholder"
    Verbose = $true
    NuGetApiKey = [PSCredential]::new('na',$APIKey).GetNetworkCredential().Password
}
Publish-Module @Params
