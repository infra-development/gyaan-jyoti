cd C:\postgres\postgresql-18.4-2-windows-x64-binaries\pgsql\bin

.\pg_ctl.exe register `
  -N "PostgreSQL18" `
  -D "C:\postgres\data"

Start-Service -Name "PostgreSQL18"

Set-Service PostgreSQL18 -StartupType Automatic

Get-Service PostgreSQL18
