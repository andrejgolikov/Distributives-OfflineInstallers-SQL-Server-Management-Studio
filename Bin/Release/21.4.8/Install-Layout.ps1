# Сценарий для установки продукта на основе содержимого макета

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

# Путь до папки макета
[string] $layoutPath = "$rootAbsolutePath\Layout\$version"
# Write-Host "layoutPath: $layoutPath"

# Путь до файла установщика
[string] $bootstrapperFilePath = "$layoutPath\vs_setup.exe"
# Write-Host "bootstrapperFilePath: $bootstrapperFilePath"



# Параметры для формирования команды для проверки содержимого макета
$ssmsProcessOptions = @{
    FilePath = """$bootstrapperFilePath"""
    ArgumentList =
        '--installPath', """D:\Program Files\Microsoft SQL Server Management Studio\21\Release""",
        '--noWeb'
}

 $ssmsProcessOptions | ConvertTo-Json
# # Запуск команды для проверки содержимого макета
Start-Process @ssmsProcessOptions
