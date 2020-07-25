dotnet restore %~dp0\..\Portal\src\Portal\Web\Web.csproj -s https://api.nuget.org/v3/index.json
dotnet build %~dp0\..\Portal\src\Portal\Web\Web.csproj -v normal

for %%F in ("%~dp0\..\Portal\src\Portal\Web\Web.csproj") do cd %%~dpF
dotnet publish -o %~dp0\..\Portal\Portal\WebPkg\Code
cd %~dp0\..
