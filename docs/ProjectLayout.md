# Project Layout

In order to use PSMekBuilder your project must be structured in a specific way.

```none
ProjectRoot
│   .gitignore
│   LICENSE
│   README.md
│
├───build
│   │   build.ps1
│   │
│   └───tasks
│           Initialize.task.ps1
│           <Other *.task.ps1 files>
│
├───docs
│       <Markdown Files>
│
├───scripts
│       <Helper scripts you use with the project>
│
└───src
│   └───<ModuleName>
│       │   <ModuleName>.psd1
│       │   <ModuleName>.psm1
│       │
│       ├───assets
│       ├───classes
│       ├───enums
│       ├───private
│       └───public
└───test
    ├───integration
    └───unit
```

## ProjectRoot

This is the top level of your project.
For example `c:\git\MyModule`

## Build

This folder contains the build scripts and build definitions

### Build\Tasks

This folder contains the `*.task.ps1` files that will be automatically parsed bu `build\build.ps1`

### Build\Build.ps1

This is the primary file called by `Invoke-Build` in order to perform all project related tasks.

## Docs

This folder contains markdown files for documentation related to your project

## Scripts

This folder contains scripts used in your project.

## Src

This is a top level source folder

### Src\<ModuleName>

This folder contains the source for your module.
This should be the case sensitive name of your module.
For example, if your module name is `MyModule`,
this folder should be `src\MyModule`.
This folder is used to programmatically determine the name of your module in the build process.

#### Src\<ModuleName>\<ModuleName>.psd1

This is the source module manifest.
It will be used as a base for creating the actual module manifest in the build process.

#### Src\<ModuleName>\<ModuleName>.psm1

This is a file that should contain "load before" code in your module.
This file should not contain functions, enums, or classes.

#### Src\<ModuleName>\assets

This folder contains extra assets used by your module.
For example, if there are text or image files your modules uses they should be include din this folder.
In the compiled module they are accessible in `$PSScriptRoot\assets\`.

#### Src\<ModuleName>\classes

This folder contains the PowerShell v5+ classes your module defines.
These will be loaded after enums and before private functions in the compiled module.
One class should be defined per file.
For example `MyClass` would be defined in `MyClass.ps1`

#### Src\<ModuleName>\enums

This folder contains the PowerShell v5+ enums your module defines.
These will be loaded before classes in the compiled module.
One enum should be defined per file.
For example, `MyEnum` would be defined in `MyEnum.ps1`

#### Src\<ModuleName>\private

This folder contains private functions that will not be exported by your module.
These are functions your classes and public functions call but you don't want to provide direct access to users.
One function should be defined per file.
For example, `Get-PrivateData` would be defined in `Get-PrivateData.ps1`.

#### Src\<ModuleName>\public

This folder contains public functions that will be exported by your module.
These are functions you want to provide direct access to users.
You do not need to do anything for them to be exported.
All functions in this folder will be detected via AST crawl and automatically exported by the build process.
One function should be defined per file.
For example, `Get-Data` would be defined in `Get-Data.ps1`.

## Test

This is a top level folder for all tests.

### Test\integration

This folder contain integration tests and each file should be named with `*.test.ps1`.

### Test\unit

This folder contains unit tests a and each file should be named with `*.test.ps1`.
