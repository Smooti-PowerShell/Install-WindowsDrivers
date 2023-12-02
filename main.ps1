[CmdletBinding()]
param (
	[Parameter(Mandatory=$false)]
	[string]
	$ImageLocation = "$($PSScriptRoot)\offlineImageRoot\sources\install.wim",

	[Parameter(Mandatory=$true)]
	[int]
	$ImageIndex,

	[Parameter(Mandatory=$false)]
	[string]
	$DriverLocation = "$($PSScriptRoot)\drivers"
)

$offlineMountLocation = "$($PSScriptRoot)\mountPoint"

Mount-WindowsImage -ImagePath $ImageLocation -Index $ImageIndex -Path $offlineMountLocation

Add-WindowsDriver -Path $offlineMountLocation -Driver $DriverLocation -Recurse -ErrorAction "SilentlyContinue"

Dismount-WindowsImage -Path $offlineMountLocation -Save