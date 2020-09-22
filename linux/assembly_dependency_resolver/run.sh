#!/bin/bash

# script - chmod 755


dotnet new console -o AppWithPlugin
dotnet new sln
dotnet sln add AppWithPlugin/AppWithPlugin.csproj

dotnet new classlib -o PluginBase
dotnet sln add PluginBase/PluginBase.csproj
dotnet add AppWithPlugin/AppWithPlugin.csproj reference PluginBase/PluginBase.csproj

dotnet.exe new classlib -o HelloPlugin
dotnet.exe sln add HelloPlugin/HelloPlugin.csproj

cp AppWithPlugin_PluginLoadContext.txt AppWithPlugin/PluginLoadContext.cs
cp -f AppWithPlugin_Program.txt AppWithPlugin/Program.cs

rm HelloPlugin/Class1.cs
cp HelloPlugin_HelloCommand.txt HelloPlugin/HelloCommand.cs
cp -f HelloPlugin_csproj.txt HelloPlugin/HelloPlugin.csproj


rm PluginBase/Class1.cs
cp PluginBase_ICommand.txt PluginBase/ICommand.cs

#dotnet.exe publish -r linux-x64 --self-contained true

dotnet.exe build

#dotnet AppWithPlugin/bin/Debug/netcoreapp3.1/linux-x64/publish/AppWithPlugin.dll
