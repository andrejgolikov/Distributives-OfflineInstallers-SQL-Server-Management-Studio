# Сценарий для проверки и исправления содержимого макета

param(
    # Версия SSMS
    [Parameter(Mandatory = $false)]
    [ValidateSet('Release\21.4.8')]
    [Alias('v')]
    [string] $version = 'Release\21.4.8'
)

# Абсолютный путь к корневой папке проекта
[string] $rootAbsolutePath = (Resolve-Path -Path "$PSScriptRoot\..\..\..").Path
# Write-Host "rootAbsolutePath: $rootAbsolutePath"

# Путь до файла установщика
[string] $bootstrapperFilePath = "$rootAbsolutePath\Bin\Bootstrapper\$version\vs_SSMS.exe"
# Write-Host "bootstrapperFilePath: $bootstrapperFilePath"

# Путь до папки макета
[string] $layoutPath = "$rootAbsolutePath\Layout\$version"
# Write-Host "layoutPath: $layoutPath"

# Параметры для формирования команды для проверки и исправления содержимого макета
$ssmsProcessOptions = @{
    FilePath = """$bootstrapperFilePath"""
    ArgumentList = 
        '--layout', """$layoutPath""",
        '--fix'
}

# Запуск команды для проверки и исправления содержимого макета
Start-Process @ssmsProcessOptions
