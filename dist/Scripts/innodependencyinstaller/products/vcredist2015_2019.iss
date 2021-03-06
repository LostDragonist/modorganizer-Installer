; requires Windows 10, Windows 7 Service Pack 1, Windows 8, Windows 8.1, Windows Server 2003 Service Pack 2, Windows Server 2008 R2 SP1, Windows Server 2008 Service Pack 2, Windows Server 2012, Windows Vista Service Pack 2, Windows XP Service Pack 3
; https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads

[CustomMessages]
vcredist2015_2019_title=Visual C++ 2015-2019 Redistributable (x86)
vcredist2015_2019_title_x64=Visual C++ 2015-2019 Redistributable (x64)

vcredist2015_2019_size=13.7 MB
vcredist2015_2019_size_x64=14.4 MB

[Code]
const
	vcredist2015_2019_url = 'http://download.visualstudio.microsoft.com/download/pr/092cda8f-872f-47fd-b549-54bbb8a81877/ddc5ec3f90091ca690a67d0d697f1242/vc_redist.x86.exe';
	vcredist2015_2019_url_x64 = 'http://download.visualstudio.microsoft.com/download/pr/21614507-28c5-47e3-973f-85e7f66545a4/f3a2caa13afd59dd0e57ea374dbe8855/vc_redist.x64.exe';

	vcredist2015_2019_upgradecode = '{65E5BD06-6392-3027-8C26-853107D3CF1A}';
	vcredist2015_2019_upgradecode_x64 = '{36F68A90-239C-34DF-B58C-64B30153CE35}';

procedure vcredist2015_2019(minVersion: string);
begin
	if (not IsIA64()) then begin
		if (not msiproductupgrade(GetString(vcredist2015_2019_upgradecode, vcredist2015_2019_upgradecode_x64, ''), minVersion)) then
			AddProduct('vcredist.' + GetArchitectureString() + '.exe',
				'/passive /norestart',
				CustomMessage('vcredist2015_2019_title' + GetArchitectureString()),
				CustomMessage('vcredist2015_2019_size' + GetArchitectureString()),
				GetString(vcredist2015_2019_url, vcredist2015_2019_url_x64, ''),
				false, false, false);
	end;
end;

[Setup]