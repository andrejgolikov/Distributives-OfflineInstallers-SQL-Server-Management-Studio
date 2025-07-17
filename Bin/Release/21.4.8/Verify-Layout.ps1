# Сценарий для проверки содержимого макета

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

# Параметры для формирования команды для проверки содержимого макета
$ssmsProcessOptions = @{
    FilePath = """$bootstrapperFilePath"""
    ArgumentList = 
        '--layout', """$layoutPath""",
        '--verify'
}

# Запуск команды для проверки содержимого макета
Start-Process @ssmsProcessOptions
