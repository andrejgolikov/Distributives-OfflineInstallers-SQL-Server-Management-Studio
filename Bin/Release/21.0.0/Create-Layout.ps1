# Сценарий для создания макета

param(
    # Версия SSMS
    [Parameter(Mandatory = $false)]
    [ValidateSet('Release\21.0.0')]
    [Alias('v')]
    [string] $version = 'Release\21.0.0'
)

# Абсолютный путь к корневой папке проекта
[string] $rootAbsolutePath = (Resolve-Path -Path "$PSScriptRoot\..\..\..").Path
# Write-Host "rootAbsolutePath: $rootAbsolutePath"

# Путь до файла установщика
[string] $bootstrapperFilePath = "$rootAbsolutePath\Bin\Bootstrapper\$version\vs_SSMS.exe"
# Write-Host "bootstrapperFilePath: $bootstrapperFilePath"

# Путь до файла конфигурации макета
[string] $layoutConfigurationFilePath = "$rootAbsolutePath\Configuration\$version\Layout.vsconfig"
# Write-Host "layoutConfigurationFilePath: $layoutConfigurationFilePath"

# Путь до папки макета
[string] $layoutPath = "$rootAbsolutePath\Layout\$version"
# Write-Host "layoutPath: $layoutPath"

# # Создание папки, если она не существует
# if (-not (Test-Path -Path $layoutPath)) {
#     New-Item -Path $layoutPath -ItemType Directory | Out-Null
# }

# Параметры для формирования команды для создания макета (все пути абсолютные)
$ssmsProcessOptions = @{
    # Путь до файла установщика
    FilePath = """$bootstrapperFilePath"""
    ArgumentList =
        # Путь до папки макета
        '--layout', """$layoutPath""",
        # Путь до файла конфигурации макета
        '--config', """$layoutConfigurationFilePath""",
        # Поддерживаемые языки
        '--lang', 'ru-ru', 'en-us'
}

# $ssmsProcessOptions | ConvertTo-Json
# Запуск команды для создания макета
Start-Process @ssmsProcessOptions

# D:\Users\GA\Downloads\Distrubutives\Offline Instllers\SQL Server Management Studio\Layout\Release\21.0.0
# D:\Users\GA\Temp\SSMS\Layout\Release\21.0.0