#define PackageName      "Base Wind"
#define PackageNameLong  "Base Wind Extension"
#define Version          "2.1.1"
#define ReleaseType      "official"

#define CoreVersion      "6.0"
#define CoreReleaseAbbr  ""

#include "J:\Scheller\LANDIS-II\deploy\package (Setup section) v6.0.iss"
#define ExtDir "C:\Program Files\LANDIS-II\v6\bin\extensions"
#define AppDir "C:\Program Files\LANDIS-II\v6\"


[Files]

; Base Wind
Source: ..\src\bin\Debug\Landis.Extension.BaseWind.dll; DestDir: {#ExtDir}; Flags: replacesameversion 
Source: ..\src\bin\Debug\Landis.Library.Metadata.dll; DestDir: {#ExtDir}; Flags: replacesameversion uninsneveruninstall

Source: docs\LANDIS-II Base Wind v2.1 User Guide.pdf; DestDir: {#AppDir}\docs
Source: examples\*.txt; DestDir: {#AppDir}\examples\base-wind
Source: examples\ecoregions.gis; DestDir: {#AppDir}\examples\base-wind
Source: examples\initial-communities.gis; DestDir: {#AppDir}\examples\base-wind
Source: examples\*.bat; DestDir: {#AppDir}\examples\base-wind

#define BaseWind "Base Wind 2.0.txt"
Source: {#BaseWind}; DestDir: {#LandisPlugInDir}

[Run]
;; Run plug-in admin tool to add the entry for the plug-in
#define PlugInAdminTool  CoreBinDir + "\Landis.PlugIns.Admin.exe"

Filename: {#PlugInAdminTool}; Parameters: "remove ""Base Wind"" "; WorkingDir: {#LandisPlugInDir}
Filename: {#PlugInAdminTool}; Parameters: "add ""{#BaseWind}"" "; WorkingDir: {#LandisPlugInDir}

[Code]
{ Check for other prerequisites during the setup initialization }
#include "J:\Scheller\LANDIS-II\deploy\package (Code section) v3.iss"

//-----------------------------------------------------------------------------

function InitializeSetup_FirstPhase(): Boolean;
begin
  Result := True
end;
