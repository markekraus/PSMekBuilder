Task Initialize {
    $Script:SrcPath = Join-Path $ProjectRoot 'src'
    $ModuleSrc = Get-ChildItem -Path $SrcPath -Directory
    $Script:ModuleSrcPath = $ModuleSrc.FullName
    $Script:ModuleName = $ModuleSrc.Name
    $Script:ModuleSrcManifestFile = Join-Path $ModuleSrcPath "$ModuleName.psd1"
    $Script:ModuleSrcRootModuleFile = Join-Path $ModuleSrcPath "$ModuleName.psm1"
    $Script:ModuleSrcPublicPath = Join-Path $ModuleSrcPath 'public'
    $Script:ModuleSrcPrivatePath = Join-Path $ModuleSrcPath 'private'
    $Script:ModuleSrcClassesPath = Join-Path $ModuleSrcPath 'classes'
    $Script:ModuleSrcEnumsPath = Join-Path $ModuleSrcPath 'enums'
    $Script:ModuleSrcAssetsPath = Join-Path $ModuleSrcPath 'assets'
    $Script:TestPath = Join-Path $ProjectRoot 'test'
    $Script:TestIntegrationPath = Join-Path $TestPath 'integration'
    $Script:TestUnitPath = Join-Path $TestPath 'unit'

    if($OutputPath) {
        'OutputPath derived from user input'
    }
    if(-not $OutputPath -and $env:Build_ArtifactStagingDirectory) {
        'OutputPath derived from Build_ArtifactStagingDirectory'
        $Script:OutputPath = $env:Build_ArtifactStagingDirectory
    }
    if(-not $OutputPath) {
        'OutputPath derived from ProjectRoot'
        $Script:OutputPath = Join-Path $ProjectRoot 'bin'
    }

    $Script:ModuleOutputPath = Join-Path $OutputPath $ModuleName
    $Script:ModuleOutputManifestFile = Join-Path $ModuleOutputPath "$ModuleName.psd1"
    $Script:ModuleOutputRootModuleFile = Join-Path $ModuleOutputPath "$ModuleName.psm1"


    ' '
    'ProjectRoot:                {0}' -f $Script:ProjectRoot
    'ModuleName:                 {0}' -f $Script:ModuleName
    'SrcPath:                    {0}' -f $Script:SrcPath
    'ModuleSrcPath:              {0}' -f $Script:ModuleSrcPath
    'ModuleSrcManifestFile:      {0}' -f $Script:ModuleSrcManifestFile
    'ModuleSrcRootModuleFile:    {0}' -f $Script:ModuleSrcRootModuleFile
    'ModuleSrcPublicPath:        {0}' -f $Script:ModuleSrcPublicPath
    'ModuleSrcPrivatePath:       {0}' -f $Script:ModuleSrcPrivatePath
    'ModuleSrcClassesPath:       {0}' -f $Script:ModuleSrcClassesPath
    'ModuleSrcEnumsPath:         {0}' -f $Script:ModuleSrcEnumsPath
    'ModuleSrcAssetsPath:        {0}' -f $Script:ModuleSrcAssetsPath
    'TestPath:                   {0}' -f $Script:TestPath
    'TestIntegrationPath:        {0}' -f $Script:TestIntegrationPath
    'TestUnitPath:               {0}' -f $Script:TestUnitPath
    'OutputPath:                 {0}' -f $Script:OutputPath
    'ModuleOutputPath:           {0}' -f $Script:ModuleOutputPath
    'ModuleOutputManifestFile:   {0}' -f $Script:ModuleOutputManifestFile
    'ModuleOutputRootModuleFile: {0}' -f $Script:ModuleOutputRootModuleFile
}