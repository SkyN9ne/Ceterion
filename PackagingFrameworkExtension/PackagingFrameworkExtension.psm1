
# Example variabe that will be exported form the module (must be "Global:")
[String]$Global:ExampleVarFromExtension = "Hello World"

#region Function Show-ExampleFunctionFromExtension
Function Show-ExampleFunctionFromExtension {
<#
.SYNOPSIS
	Example Function that simply outputs a textstring that is given as input parameter
.DESCRIPTION
	Not much to say
.PARAMETER String
	A text string
.EXAMPLE
	ExampleFunctionFromExtension -String "Hello World"
.NOTES
	Created by ceterion AG
	This is an internal script function and should typically not be called directly.
.LINK
	http://www.ceterion.com
#>
	[CmdletBinding()]
	Param (
		#  Get the current date
		[Parameter(Mandatory=$True)]
		[ValidateNotNullorEmpty()]
		[string]$String
	)
	
	Begin {
		## Get the name of this function and write header
		[string]${CmdletName} = $PSCmdlet.MyInvocation.MyCommand.Name
		Write-FunctionHeaderOrFooter -CmdletName ${CmdletName} -CmdletBoundParameters $PSBoundParameters -Header
	}
	Process {
		Try {
			Write-Host $String
		}
		Catch {
                Write-Log -Message "Unexpected error . `n$(Resolve-Error)" -Severity 3 -Source ${CmdletName}
    			If (-not $ContinueOnError) {
				Throw "Unexpected error.: $($_.Exception.Message)"
			}
		}
	}
	End {
		Write-FunctionHeaderOrFooter -CmdletName ${CmdletName} -Footer
	}
}
#endregion Function Show-ExampleFunctionFromExtension

#region PackageStartExtension
[Scriptblock]$Global:PackageStartExtension = {
    
    # The content of this script block will be executed automatically at package start. You can place your own custom code inside this script block

}
#endregion PackageStartExtension

#region PackageEndExtension
[Scriptblock]$Global:PackageEndExtension = {

    # The content of this script block will be executed automatically at package end. You can place your own custom code inside this script block

}
#endregion PackageEndExtension


## Export functions, aliases and variables
Export-ModuleMember -Function * -Alias * -Variable *
# SIG # Begin signature block
# MIIuPAYJKoZIhvcNAQcCoIIuLTCCLikCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCA5RjKlPRPMHJ1O
# uSxte0iWYhnNtkYcOR79V6rAQeVe4aCCJnAwggXJMIIEsaADAgECAhAbtY8lKt8j
# AEkoya49fu0nMA0GCSqGSIb3DQEBDAUAMH4xCzAJBgNVBAYTAlBMMSIwIAYDVQQK
# ExlVbml6ZXRvIFRlY2hub2xvZ2llcyBTLkEuMScwJQYDVQQLEx5DZXJ0dW0gQ2Vy
# dGlmaWNhdGlvbiBBdXRob3JpdHkxIjAgBgNVBAMTGUNlcnR1bSBUcnVzdGVkIE5l
# dHdvcmsgQ0EwHhcNMjEwNTMxMDY0MzA2WhcNMjkwOTE3MDY0MzA2WjCBgDELMAkG
# A1UEBhMCUEwxIjAgBgNVBAoTGVVuaXpldG8gVGVjaG5vbG9naWVzIFMuQS4xJzAl
# BgNVBAsTHkNlcnR1bSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTEkMCIGA1UEAxMb
# Q2VydHVtIFRydXN0ZWQgTmV0d29yayBDQSAyMIICIjANBgkqhkiG9w0BAQEFAAOC
# Ag8AMIICCgKCAgEAvfl4+ObVgAxknYYblmRnPyI6HnUBfe/7XGeMycxca6mR5rlC
# 5SBLm9qbe7mZXdmbgEvXhEArJ9PoujC7Pgkap0mV7ytAJMKXx6fumyXvqAoAl4Va
# qp3cKcniNQfrcE1K1sGzVrihQTib0fsxf4/gX+GxPw+OFklg1waNGPmqJhCrKtPQ
# 0WeNG0a+RzDVLnLRxWPa52N5RH5LYySJhi40PylMUosqp8DikSiJucBb+R3Z5yet
# /5oCl8HGUJKbAiy9qbk0WQq/hEr/3/6zn+vZnuCYI+yma3cWKtvMrTscpIfcRnNe
# GWJoRVfkkIJCu0LW8GHgwaM9ZqNd9BjuiMmNF0UpmTJ1AjHuKSbIawLmtWJFfzcV
# WiNoidQ+3k4nsPBADLxNF8tNorMe0AZa3faTz1d1mfX6hhpneLO/lv403L3nUlbl
# s+V1e9dBkQXcXWnjlQ1DufyDljmVe2yAWk8TcsbXfSl6RLpSpCrVQUYJIP4ioLZb
# MI28iQzV13D4h1L92u+sUS4Hs07+0AnacO+Y+lbmbdu1V0vc5SwlFcieLnhO+Nqc
# noYsylfzGuXIkosagpZ6w7xQEmnYDlpGizrrJvojybawgb5CAKT41v4wLsfSRvbl
# jnX98sy50IdbzAYQYLuDNbdeZ95H7JlI8aShFf6tjGKOOVVPORa5sWOd/7cCAwEA
# AaOCAT4wggE6MA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFLahVDkCw6A/joq8
# +tT4HKbROg79MB8GA1UdIwQYMBaAFAh2zcsH/yT2xc3tu5C84oQ3RnX3MA4GA1Ud
# DwEB/wQEAwIBBjAvBgNVHR8EKDAmMCSgIqAghh5odHRwOi8vY3JsLmNlcnR1bS5w
# bC9jdG5jYS5jcmwwawYIKwYBBQUHAQEEXzBdMCgGCCsGAQUFBzABhhxodHRwOi8v
# c3ViY2Eub2NzcC1jZXJ0dW0uY29tMDEGCCsGAQUFBzAChiVodHRwOi8vcmVwb3Np
# dG9yeS5jZXJ0dW0ucGwvY3RuY2EuY2VyMDkGA1UdIAQyMDAwLgYEVR0gADAmMCQG
# CCsGAQUFBwIBFhhodHRwOi8vd3d3LmNlcnR1bS5wbC9DUFMwDQYJKoZIhvcNAQEM
# BQADggEBAFHCoVgWIhCL/IYx1MIy01z4S6Ivaj5N+KsIHu3V6PrnCA3st8YeDrJ1
# BXqxC/rXdGoABh+kzqrya33YEcARCNQOTWHFOqj6seHjmOriY/1B9ZN9DbxdkjuR
# mmW60F9MvkyNaAMQFtXx0ASKhTP5N+dbLiZpQjy6zbzUeulNndrnQ/tjUoCFBMQl
# lVXwfqefAcVbKPjgzoZwpic7Ofs4LphTZSJ1Ldf23SIikZbr3WjtP6MZl9M7JYjs
# NhI9qX7OAo0FmpKnJ25FspxihjcNpDOO16hO0EoXQ0zF8ads0h5YbBRRfopUofbv
# n3l6XYGaFpAP4bvxSgD5+d2+7arszgowggXSMIIDuqADAgECAhAh1tBKTyUPyTI3
# /KpeEo3pMA0GCSqGSIb3DQEBDQUAMIGAMQswCQYDVQQGEwJQTDEiMCAGA1UEChMZ
# VW5pemV0byBUZWNobm9sb2dpZXMgUy5BLjEnMCUGA1UECxMeQ2VydHVtIENlcnRp
# ZmljYXRpb24gQXV0aG9yaXR5MSQwIgYDVQQDExtDZXJ0dW0gVHJ1c3RlZCBOZXR3
# b3JrIENBIDIwIhgPMjAxMTEwMDYwODM5NTZaGA8yMDQ2MTAwNjA4Mzk1NlowgYAx
# CzAJBgNVBAYTAlBMMSIwIAYDVQQKExlVbml6ZXRvIFRlY2hub2xvZ2llcyBTLkEu
# MScwJQYDVQQLEx5DZXJ0dW0gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxJDAiBgNV
# BAMTG0NlcnR1bSBUcnVzdGVkIE5ldHdvcmsgQ0EgMjCCAiIwDQYJKoZIhvcNAQEB
# BQADggIPADCCAgoCggIBAL35ePjm1YAMZJ2GG5ZkZz8iOh51AX3v+1xnjMnMXGup
# kea5QuUgS5vam3u5mV3Zm4BL14RAKyfT6Lowuz4JGqdJle8rQCTCl8en7psl76gK
# AJeFWqqd3CnJ4jUH63BNStbBs1a4oUE4m9H7MX+P4F/hsT8PjhZJYNcGjRj5qiYQ
# qyrT0NFnjRtGvkcw1S5y0cVj2udjeUR+S2MkiYYuND8pTFKLKqfA4pEoibnAW/kd
# 2ecnrf+aApfBxlCSmwIsvam5NFkKv4RK/9/+s5/r2Z7gmCPspmt3FirbzK07HKSH
# 3EZzXhliaEVX5JCCQrtC1vBh4MGjPWajXfQY7ojJjRdFKZkydQIx7ikmyGsC5rVi
# RX83FVojaInUPt5OJ7DwQAy8TRfLTaKzHtAGWt32k89XdZn1+oYaZ3izv5b+NNy9
# 51JW5bPldXvXQZEF3F1p45UNQ7n8g5Y5lXtsgFpPE3LG130pekS6UqQq1UFGCSD+
# IqC2WzCNvIkM1ddw+IdS/drvrFEuB7NO/tAJ2nDvmPpW5m3btVdL3OUsJRXIni54
# TvjanJ6GLMpX8xrlyJKLGoKWesO8UBJp2A5aRos66yb6I8m2sIG+QgCk+Nb+MC7H
# 0kb25Y51/fLMudCHW8wGEGC7gzW3XmfeR+yZSPGkoRX+rYxijjlVTzkWubFjnf+3
# AgMBAAGjQjBAMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFLahVDkCw6A/joq8
# +tT4HKbROg79MA4GA1UdDwEB/wQEAwIBBjANBgkqhkiG9w0BAQ0FAAOCAgEAcaUO
# zuTpvz841YlaxAJh+0zFFBcti09TaxAX/GWExxBJkN7bxyaTiCZvcNYCXjmg94+r
# lrWlE1yBFG0OgYIRG4pOxk+l3WIeRN8JWfRbdws36YsgxvgKTi5YHOsz0M+GYMna
# +4AvnkxghHg9IWTW+0EfGA/nyXVxvb1c3jSHPkGwDva51j8JE5YUL96aHVq5Vs41
# OrBfcE1e4ynxIyhyWbarwoxmJhx3LCZ2NYsop2mg+Tv1I92FEHTJkANWkeevukfU
# EpcRIuOiSZRs57eUS7otpNozi0ymRP9aPMYdZNi1MeSmPHqoVwvb7WEay/HOc3dj
# pIdvTFE41uRfx5+2gSrkhUh5WF47+NsCgmfBOdvDdEs9Nh75KZOIaFuoRBkh8Kfo
# gQ0s6JM2tDeyyrAbJnqaJR+amoCeSyo/+6Oa/nMyccKexnLhimgn8eQPtMRMpWGT
# +JcQByowJam5yHG472jMLX714H4Pgqhvtrpsg0N3zYqSF6GeW3gWPUXiM3Ld4WbK
# mdPJxSb9DWgERq622ZuMvhm+scbyGeNcAsos2G9KB9nJNdpAdfLEpxlvnkIQmHXm
# lYtgvO3FEteKztWYXFaWA8XudwY1/8/k7j8TYe7b2i2F8M2unbIYCUXDkqFyF/xH
# tqALLPHE3kNoCGpfO/B2Y/vMBiymxuIOtbm+JI8wggaUMIIEfKADAgECAhAr1K5w
# udBjWyrphMjWdKowMA0GCSqGSIb3DQEBDAUAMFYxCzAJBgNVBAYTAlBMMSEwHwYD
# VQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAiBgNVBAMTG0NlcnR1bSBU
# aW1lc3RhbXBpbmcgMjAyMSBDQTAeFw0yMjA3MjgwODU2MjZaFw0zMzA3MjcwODU2
# MjZaMFAxCzAJBgNVBAYTAlBMMSEwHwYDVQQKDBhBc3NlY28gRGF0YSBTeXN0ZW1z
# IFMuQS4xHjAcBgNVBAMMFUNlcnR1bSBUaW1lc3RhbXAgMjAyMjCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAMrFXu0fCUbwRMtqXliGb6KwhLCeP4vySHEq
# QBI78xFcjqQae26x7v21UvkWS+X0oTh61yTcdoZaQAg5hNcBqWbGn7b8OOEXkGwU
# vGZ65MWKl2lXBjisc6d1GWVI5fXkP9+ddLVX4G/pP7eIdAtI5Fh4rGC/x9/vNan9
# C8C4I56N525HwiKzqPSz6Z5N2XYM0+bT4VdYsZxyPRwLkjhcqdzg2tCB2+YP6ld+
# uBOkcfCrhFCeeTB4Y/ZalrZXaCGFIlBWjIyXb9UGspAaoDvP2LCSSRcnvrP49qII
# GD7TqHbDoYumubWDgx8/YE7M5Bfd7F14mQOqnr7ImCFS5Ty/nfSO7XVSQ6TrlIYX
# 8rLA4BSjnOu0WoYZTLOWyaekWPraAAhvzJQ3mXt6ruGa6VEljyzDTUfgEmSDpnxP
# 6OFSOOc4xBOXbkV8OO4ivGf0pIff+IOsysOwvuSSHfF1FxSerNZb3VcUneyQaT+o
# mC+kaGTPpvsyly53V/MUKuHVhgRIrGiWIJgN9Tr73oZXHk6mbuzkXiHhao/1AQrQ
# 35q+mtGKvnXtf62dsJFztYf/XceELTw/KJd1YL7hlQ9zGR/fFE+fx9pvLd2yZ3Y1
# PCtpaNzq6i7JZ2mRldC1XwikBtjoQ6GT2T3kyRn0lAU8Y4/TdN/4pptwouFk+75J
# sdToPQ6BAgMBAAGjggFiMIIBXjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBQjwTzM
# UzMZVo7Y4/POPPyoc0dW6jAfBgNVHSMEGDAWgBS+VAIvv0Bsc0POrAklTp5DRBru
# 4DAOBgNVHQ8BAf8EBAMCB4AwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwMwYDVR0f
# BCwwKjAooCagJIYiaHR0cDovL2NybC5jZXJ0dW0ucGwvY3RzY2EyMDIxLmNybDBv
# BggrBgEFBQcBAQRjMGEwKAYIKwYBBQUHMAGGHGh0dHA6Ly9zdWJjYS5vY3NwLWNl
# cnR1bS5jb20wNQYIKwYBBQUHMAKGKWh0dHA6Ly9yZXBvc2l0b3J5LmNlcnR1bS5w
# bC9jdHNjYTIwMjEuY2VyMEAGA1UdIAQ5MDcwNQYLKoRoAYb2dwIFAQswJjAkBggr
# BgEFBQcCARYYaHR0cDovL3d3dy5jZXJ0dW0ucGwvQ1BTMA0GCSqGSIb3DQEBDAUA
# A4ICAQBrxvc9Iz4vV5D57BeApm1pfVgBjTKWgflb1htxJA9HSvXneq/j/+5kohu/
# 1p0j6IJMYTpSbT7oHAtg59m0wM0HnmrjcN43qMNo5Ts/gX/SBmY0qMzdlO6m1D9e
# gn7U49EgGO+IZFAnmMH1hLx+pse6dgtThZ4aqr+zRfRNoTFNSUxyOSo6cmVKfRbZ
# gTiLEcMehGJTeM5CQs1AmDpF+hqyq0X6Mv0BMtHU2wPoVlI3xrRQ167lM64/gl8d
# CYzMPF8l8W89ds2Rfro9Y1p5dI0L8x60opb1f8n5Hf4ayW9Kc7rgUdlnfJc4cYdv
# V0JxWYpSZPN5LJM54xSKrveXnYq1NNIuovqJOM9mixVMJ2TTWPkfQ2pl0H/Zokxx
# XB4qEKAySa6bfcijoQiOaR5wKQR+0yrc7KIdqt+hOVhl5uUti9cZxA8JMiNdX6Sa
# asglnJ9olTSMJ4BRO6tCASEvJeeCzX6ZViKRDHbFQCaMZ1XdxlwR6Cqkfa2p5EN1
# DKQSjxI1p6lddQmc9PTVGWM8dpbRKtHHBoOQvfWEdigP3EI7RGZqWTonwr8AaMCg
# TzYbFpuZed3lG7yi0jwUJo9/ryUNFA82m9CpzLcaAKaLQ0s1uboR6zaWSt9fqUAS
# Nz9zD+8IiGlyUqKIAFViQMqqyHej0vK7G2gPqEy5GDdxL/DBaTCCBrcwggSfoAMC
# AQICEGL8teUMa7gqh7ZMNIbcDUEwDQYJKoZIhvcNAQELBQAwVjELMAkGA1UEBhMC
# UEwxITAfBgNVBAoTGEFzc2VjbyBEYXRhIFN5c3RlbXMgUy5BLjEkMCIGA1UEAxMb
# Q2VydHVtIENvZGUgU2lnbmluZyAyMDIxIENBMB4XDTIyMDgwODE1MjkzMVoXDTI1
# MDgwNzE1MjkzMFowXTELMAkGA1UEBhMCREUxDzANBgNVBAgMBkhlc3NlbjERMA8G
# A1UEBwwIRXNjaGJvcm4xFDASBgNVBAoMC2NldGVyaW9uIEFHMRQwEgYDVQQDDAtj
# ZXRlcmlvbiBBRzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAMgqJhvo
# vfISjaFsmVnPYHMgqqEyUiLuDn0o3TTBiTgcZAnoICLY04QpK2Dche9y+SHXIT5e
# Rr25jbpziP+Fn1e1wkTI6rtJJFxH1qjFlLwuAatGRTx3ug1Bl0ArUeDNWYQNWaC+
# pafQ1XzaJPviG7fvsliO/6maz5FKJRM5H4tsDhMZ4fEV4Jn3i5W18d2NkyBFIS24
# SCFNqMAj0TqYabLM63sPaFTwdPK2mJUbRECaJ65Nji0PUpqGXYIB4DWhCD5muYdX
# k1rUVxnaNoJs1ADvQlkBoL4eEl/igIV3QRFqulFSwLRXO8wXUtOI7Dq2lZu+FDrv
# 20rP9X/lcJauq0gDBm6ZSUyeAvEGlv1uydIFcsJBQg4ZlZBA7fOtMxq1+bqi1Xng
# Swe6lcZgr2W6Yg021/Z6HJ5NrypRP2kyB2wkmjSh6fh6jCiPU/9wHhqfPoB0Xfuq
# GstZvZo16fZCbtxPyzR1HsZpW7i4E12VM9c+hwZ0GdA6RGJ/aAIn00SJwpNPXiuv
# bDMUmws8csAp7+eDzn5/0hEDTL75M6uNKnRikDdpgHSg9ykzL5y75KEbyaKsi8E3
# NdMWbSsX+lLNR4kXIoUZ8k5YbzY0zaAWU3xNzlR3xRS/XXzH/udtlAt7NKTBJApv
# UJC0JPfPQXiTCS6LPzRgGMY3A9JxfX3X+R1fAgMBAAGjggF4MIIBdDAMBgNVHRMB
# Af8EAjAAMD0GA1UdHwQ2MDQwMqAwoC6GLGh0dHA6Ly9jY3NjYTIwMjEuY3JsLmNl
# cnR1bS5wbC9jY3NjYTIwMjEuY3JsMHMGCCsGAQUFBwEBBGcwZTAsBggrBgEFBQcw
# AYYgaHR0cDovL2Njc2NhMjAyMS5vY3NwLWNlcnR1bS5jb20wNQYIKwYBBQUHMAKG
# KWh0dHA6Ly9yZXBvc2l0b3J5LmNlcnR1bS5wbC9jY3NjYTIwMjEuY2VyMB8GA1Ud
# IwQYMBaAFN10XUwA23ufoHTKsW73PMAywHDNMB0GA1UdDgQWBBQDYLx5fpnKbox5
# /2t/KQDe622pVjBLBgNVHSAERDBCMAgGBmeBDAEEATA2BgsqhGgBhvZ3AgUBBDAn
# MCUGCCsGAQUFBwIBFhlodHRwczovL3d3dy5jZXJ0dW0ucGwvQ1BTMBMGA1UdJQQM
# MAoGCCsGAQUFBwMDMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsFAAOCAgEA
# TBLZ3tWUwnWdEOleRQHr9Efdze+qcyTkqNbu345uqI/i6b8ZUTNqtg9QmfLVN1RX
# 41m1h7qTEKPx5dAXepX2fHfmCDctJdKZzQN9/R5EChuPVkG5uB/SWtBeMckG4Kpq
# BMXAuYKJqaK3bRqr8qLbUbCyVsS/hIs3q80i2W/IKxG3U67V/23kDiOiTFneuqjn
# 7Zg1VXy2VN61Cr8A90fIqPz1g3UKHMXRnbrWlBgHOmDirUo8HdshgyPKm2JUoEhV
# H51Z6ajN4bFeAH720+FYjMiDQwjKVgzro/HpapW5qJdK8CLc8/VHj9IHE5yu6FfY
# wnJwJSTSNPnYqw+Br4iIE7YKC1mmR4riR4S0c91NUBo71bQZGu70NMIlPz0l62rc
# qXVimllopyYxKaS7elPuRbsAeSWDXxCDydTLnOhTXNeYi38r9eS5rEhHAfOMgLtb
# CFV9NxfA71vXg+k/KdLgh92Lq6MTvK/5/9/SuDvf1HlZatLLZ0BvgDc9/1l53rUg
# N/XixB+14S8edkL0Lhtubv0D+ZXJjxrZRwkAvRU8tktkwhh5qhgRVRtcJrXi9hVJ
# KfUj++IC62H6IZh8buJhdvkuMgIovKT+XagvQFgiBGh4XOozoSfu/X90DpOTi3f0
# 0ruxIiMRG0UyePdg3a1kcnd25sDE1vqYQU52S6zOr0swgga5MIIEoaADAgECAhEA
# maOACiZVO2Wr3G6EprPqOTANBgkqhkiG9w0BAQwFADCBgDELMAkGA1UEBhMCUEwx
# IjAgBgNVBAoTGVVuaXpldG8gVGVjaG5vbG9naWVzIFMuQS4xJzAlBgNVBAsTHkNl
# cnR1bSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTEkMCIGA1UEAxMbQ2VydHVtIFRy
# dXN0ZWQgTmV0d29yayBDQSAyMB4XDTIxMDUxOTA1MzIxOFoXDTM2MDUxODA1MzIx
# OFowVjELMAkGA1UEBhMCUEwxITAfBgNVBAoTGEFzc2VjbyBEYXRhIFN5c3RlbXMg
# Uy5BLjEkMCIGA1UEAxMbQ2VydHVtIENvZGUgU2lnbmluZyAyMDIxIENBMIICIjAN
# BgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAnSPPBDAjO8FGLOczcz5jXXp1ur5c
# Tbq96y34vuTmflN4mSAfgLKTvggv24/rWiVGzGxT9YEASVMw1Aj8ewTS4IndU8s7
# VS5+djSoMcbvIKck6+hI1shsylP4JyLvmxwLHtSworV9wmjhNd627h27a8RdrT1P
# H9ud0IF+njvMk2xqbNTIPsnWtw3E7DmDoUmDQiYi/ucJ42fcHqBkbbxYDB7SYOou
# u9Tj1yHIohzuC8KNqfcYf7Z4/iZgkBJ+UFNDcc6zokZ2uJIxWgPWXMEmhu1gMXgv
# 8aGUsRdaCtVD2bSlbfsq7BiqljjaCun+RJgTgFRCtsuAEw0pG9+FA+yQN9n/kZtM
# LK+Wo837Q4QOZgYqVWQ4x6cM7/G0yswg1ElLlJj6NYKLw9EcBXE7TF3HybZtYvj9
# lDV2nT8mFSkcSkAExzd4prHwYjUXTeZIlVXqj+eaYqoMTpMrfh5MCAOIG5knN4Q/
# JHuurfTI5XDYO962WZayx7ACFf5ydJpoEowSP07YaBiQ8nXpDkNrUA9g7qf/rCkK
# bWpQ5boufUnq1UiYPIAHlezf4muJqxqIns/kqld6JVX8cixbd6PzkDpwZo4SlADa
# Ci2JSplKShBSND36E/ENVv8urPS0yOnpG4tIoBGxVCARPCg1BnyMJ4rBJAcOSnAW
# d18Jx5n858JSqPECAwEAAaOCAVUwggFRMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0O
# BBYEFN10XUwA23ufoHTKsW73PMAywHDNMB8GA1UdIwQYMBaAFLahVDkCw6A/joq8
# +tT4HKbROg79MA4GA1UdDwEB/wQEAwIBBjATBgNVHSUEDDAKBggrBgEFBQcDAzAw
# BgNVHR8EKTAnMCWgI6Ahhh9odHRwOi8vY3JsLmNlcnR1bS5wbC9jdG5jYTIuY3Js
# MGwGCCsGAQUFBwEBBGAwXjAoBggrBgEFBQcwAYYcaHR0cDovL3N1YmNhLm9jc3At
# Y2VydHVtLmNvbTAyBggrBgEFBQcwAoYmaHR0cDovL3JlcG9zaXRvcnkuY2VydHVt
# LnBsL2N0bmNhMi5jZXIwOQYDVR0gBDIwMDAuBgRVHSAAMCYwJAYIKwYBBQUHAgEW
# GGh0dHA6Ly93d3cuY2VydHVtLnBsL0NQUzANBgkqhkiG9w0BAQwFAAOCAgEAdYhY
# D+WPUCiaU58Q7EP89DttyZqGYn2XRDhJkL6P+/T0IPZyxfxiXumYlARMgwRzLRUS
# tJl490L94C9LGF3vjzzH8Jq3iR74BRlkO18J3zIdmCKQa5LyZ48IfICJTZVJeChD
# UyuQy6rGDxLUUAsO0eqeLNhLVsgw6/zOfImNlARKn1FP7o0fTbj8ipNGxHBIutiR
# sWrhWM2f8pXdd3x2mbJCKKtl2s42g9KUJHEIiLni9ByoqIUul4GblLQigO0ugh7b
# WRLDm0CdY9rNLqyA3ahe8WlxVWkxyrQLjH8ItI17RdySaYayX3PhRSC4Am1/7mAT
# wZWwSD+B7eMcZNhpn8zJ+6MTyE6YoEBSRVrs0zFFIHUR08Wk0ikSf+lIe5Iv6RY3
# /bFAEloMU+vUBfSouCReZwSLo8WdrDlPXtR0gicDnytO7eZ5827NS2x7gCBibESY
# kOh1/w1tVxTpV2Na3PR7nxYVlPu1JPoRZCbH86gc96UTvuWiOruWmyOEMLOGGniR
# +x+zPF/2DaGgK2W1eEJfo2qyrBNPvF7wuAyQfiFXLwvWHamoYtPZo0LHuH8X3n9C
# +xN4YaNjt2ywzOr+tKyEVAotnyU9vyEVOaIYMk3IeBrmFnn0gbKeTTyYeEEUz/Qw
# t4HOUBCrW602NCmvO1nm+/80nLy5r0AZvCQxaQ4wgga5MIIEoaADAgECAhEA5/9p
# xzs1zkuRJth0fGilhzANBgkqhkiG9w0BAQwFADCBgDELMAkGA1UEBhMCUEwxIjAg
# BgNVBAoTGVVuaXpldG8gVGVjaG5vbG9naWVzIFMuQS4xJzAlBgNVBAsTHkNlcnR1
# bSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTEkMCIGA1UEAxMbQ2VydHVtIFRydXN0
# ZWQgTmV0d29yayBDQSAyMB4XDTIxMDUxOTA1MzIwN1oXDTM2MDUxODA1MzIwN1ow
# VjELMAkGA1UEBhMCUEwxITAfBgNVBAoTGEFzc2VjbyBEYXRhIFN5c3RlbXMgUy5B
# LjEkMCIGA1UEAxMbQ2VydHVtIFRpbWVzdGFtcGluZyAyMDIxIENBMIICIjANBgkq
# hkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA6RIfBDXtuV16xaaVQb6KZX9Od9FtJXXT
# Zo7b+GEof3+3g0ChWiKnO7R4+6MfrvLyLCWZa6GpFHjEt4t0/GiUQvnkLOBRdBqr
# 5DOvlmTvJJs2X8ZmWgWJjC7PBZLYBWAs8sJl3kNXxBMX5XntjqWx1ZOuuXl0R4x+
# zGGSMzZ45dpvB8vLpQfZkfMC/1tL9KYyjU+htLH68dZJPtzhqLBVG+8ljZ1ZFilO
# KksS79epCeqFSeAUm2eMTGpOiS3gfLM6yvb8Bg6bxg5yglDGC9zbr4sB9ceIGRtC
# QF1N8dqTgM/dSViiUgJkcv5dLNJeWxGCqJYPgzKlYZTgDXfGIeZpEFmjBLwURP5A
# BsyKoFocMzdjrCiFbTvJn+bD1kq78qZUgAQGGtd6zGJ88H4NPJ5Y2R4IargiWAmv
# 8RyvWnHr/VA+2PrrK9eXe5q7M88YRdSTq9TKbqdnITUgZcjjm4ZUjteq8K331a4P
# 0s2in0p3UubMEYa/G5w6jSWPUzchGLwWKYBfeSu6dIOC4LkeAPvmdZxSB1lWOb9H
# zVWZoM8Q/blaP4LWt6JxjkI9yQsYGMdCqwl7uMnPUIlcExS1mzXRxUowQref/EPa
# S7kYVaHHQrp4XB7nTEtQhkP0Z9Puz/n8zIFnUSnxDof4Yy650PAXSYmK2TcbyDoT
# Nmmt8xAxzcMCAwEAAaOCAVUwggFRMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYE
# FL5UAi+/QGxzQ86sCSVOnkNEGu7gMB8GA1UdIwQYMBaAFLahVDkCw6A/joq8+tT4
# HKbROg79MA4GA1UdDwEB/wQEAwIBBjATBgNVHSUEDDAKBggrBgEFBQcDCDAwBgNV
# HR8EKTAnMCWgI6Ahhh9odHRwOi8vY3JsLmNlcnR1bS5wbC9jdG5jYTIuY3JsMGwG
# CCsGAQUFBwEBBGAwXjAoBggrBgEFBQcwAYYcaHR0cDovL3N1YmNhLm9jc3AtY2Vy
# dHVtLmNvbTAyBggrBgEFBQcwAoYmaHR0cDovL3JlcG9zaXRvcnkuY2VydHVtLnBs
# L2N0bmNhMi5jZXIwOQYDVR0gBDIwMDAuBgRVHSAAMCYwJAYIKwYBBQUHAgEWGGh0
# dHA6Ly93d3cuY2VydHVtLnBsL0NQUzANBgkqhkiG9w0BAQwFAAOCAgEAuJNZd8lM
# Ff2UBwigp3qgLPBBk58BFCS3Q6aJDf3TISoytK0eal/JyCB88aUEd0wMNiEcNVMb
# K9j5Yht2whaknUE1G32k6uld7wcxHmw67vUBY6pSp8QhdodY4SzRRaZWzyYlviUp
# yU4dXyhKhHSncYJfa1U75cXxCe3sTp9uTBm3f8Bj8LkpjMUSVTtMJ6oEu5JqCYzR
# fc6nnoRUgwz/GVZFoOBGdrSEtDN7mZgcka/tS5MI47fALVvN5lZ2U8k7Dm/hTX8C
# WOw0uBZloZEW4HB0Xra3qE4qzzq/6M8gyoU/DE0k3+i7bYOrOk/7tPJg1sOhytOG
# UQ30PbG++0FfJioDuOFhj99b151SqFlSaRQYz74y/P2XJP+cF19oqozmi0rRTkfy
# EJIvhIZ+M5XIFZttmVQgTxfpfJwMFFEoQrSrklOxpmSygppsUDJEoliC05vBLVQ+
# gMZyYaKvBJ4YxBMlKH5ZHkRdloRYlUDplk8GUa+OCMVhpDSQurU6K1ua5dmZftnv
# SSz2H96UrQDzA6DyiI1V3ejVtvn2azVAXg6NnjmuRZ+wa7Pxy0H3+V4K4rOTHlG3
# VYA6xfLsTunCz72T6Ot4+tkrDYOeaU1pPX1CBfYj6EW2+ELq46GP8KCNUQDirWLU
# 4nOmgCat7vN0SD6RlwUiSsMeCiQDmZwgwrUxggciMIIHHgIBATBqMFYxCzAJBgNV
# BAYTAlBMMSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAiBgNV
# BAMTG0NlcnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQQIQYvy15QxruCqHtkw0htwN
# QTANBglghkgBZQMEAgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkG
# CSqGSIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEE
# AYI3AgEVMC8GCSqGSIb3DQEJBDEiBCDUSC4FRna8VaAUj7p+TtLyGM+gW3hV+d+P
# zph7K9G4pjANBgkqhkiG9w0BAQEFAASCAgCY3KIMx7xBScaSMlbjFlnvpkMYOUCW
# DzG6VGY3/58hpbfbmqmZkEdVnMF1fR6aNWJEVK3ja7e5whYh4FcI2OGVJB2FXrep
# BgZ78V2d2MNDL8vTJx8yrkd9FKCzuKkwzBVoRqQ46aqB9msCpEUbvXeQcqbuhB7R
# Ta9BeHnfpPq/qTJpjJgNc9MOQwWOi5TEJfcdf64oqFnBLLBAJtsiiC/ZFuosrQki
# RFa4lTEb7hK+1IEBauYQ/csDfjVS4JZLc+RVj3lQXzR3/HPZVJExwOtev5z1Ryr5
# uFp16PDfUIRpo+b/aZTvUEIDbkmj/J9g5BV/Ju9SHStROZToN6J3wojjyOEOJTae
# ZCcFYlLeciubdR8cA3yEomQFGtkQt9NL4vD6q8vb6XLIV4uj5JkMfhCqwg++BK4S
# Uz1qfK4jywVM8zJvVeAjfDJHHGgwsPvYtPsnx3E6D22i7k/Ha0gJe0Obb5rpxdma
# 50WW/eb6dBqyeXXjGkJsmbEc0S2BaMqyWJI0wXx+UUuCWxH3ISeYdIDe3Na4stgW
# uA0otBQwmQAgheyt+hji3AvJ/MA/fQGWKx90Lqx/V8tUstsn1SsPOwl2yQjU0CiX
# mi4vA+D5hnWOSiFliT1Hbd5nVvmsC5g9hY3xFl9aRYVsHsGUpy2C0zz5NyZHq1Hp
# xtIijYUr4PkYEqGCBAIwggP+BgkqhkiG9w0BCQYxggPvMIID6wIBATBqMFYxCzAJ
# BgNVBAYTAlBMMSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAi
# BgNVBAMTG0NlcnR1bSBUaW1lc3RhbXBpbmcgMjAyMSBDQQIQK9SucLnQY1sq6YTI
# 1nSqMDANBglghkgBZQMEAgIFAKCCAVYwGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJ
# EAEEMBwGCSqGSIb3DQEJBTEPFw0yMjEyMDYxNTI5MzFaMDcGCyqGSIb3DQEJEAIv
# MSgwJjAkMCIEIAO5mmRJdJhKlbbMXYDTRNB0+972yiQEhCvmzw5EIgeKMD8GCSqG
# SIb3DQEJBDEyBDAiHK+SpHWQWbvjJarZZKQlLUoamgRaO4Uvx6LeJd4/K95tRO3l
# M2NPNxcqoEF7Qz0wgZ8GCyqGSIb3DQEJEAIMMYGPMIGMMIGJMIGGBBS/T2vEmC3e
# FQWo78jHp51NFDUAzjBuMFqkWDBWMQswCQYDVQQGEwJQTDEhMB8GA1UEChMYQXNz
# ZWNvIERhdGEgU3lzdGVtcyBTLkEuMSQwIgYDVQQDExtDZXJ0dW0gVGltZXN0YW1w
# aW5nIDIwMjEgQ0ECECvUrnC50GNbKumEyNZ0qjAwDQYJKoZIhvcNAQEBBQAEggIA
# eP/tIt8I0dzFLS3Mj0pU4pMWzmGlZpueVsjmTeG0rfZfDTrEC2BOHeqrfB3FbEIg
# /YJftcSnNvL+hFpPRC6Tdpme1WtC8EkW5fWLsH2SOqRSuG/0xoLpgZFJ1ejWLC9L
# tb7z1el50lbkl8atng4dcbSgrzDMfFWCVjNKtUnYEgu4GNs4WRu9alxpHK1CoGQV
# ob8wPzT1dx6dEJA1RFHckPN3kMCQxCoxnbbU4CtL1kgbt6vYCv6zz6P2fxelt7lW
# lDqtjvuyLTl3U81qJNyilnfBNPjWoUf+AG4CNP2KM5T17B3t1bhvo03U3njyzfCN
# VItXmXB+dMAaQOshsnIovP5u9PIkbufez2Wdx7ptJfxHZS0pnuO99GSLibBXxJUl
# lZz8t+4s0B0rXGwFP+r5uEU+ehdMjya42jkVR+7OEh//VYzSyo8UrCBKxzPQefsX
# HR4uPJEyFEwNU4KE0fJg1rXZ5rQd1aUJZdxvLw6kDqBd1daL9xuEwPyIy0w9ULow
# ulR0zKxe9R4R5X2qIhTpG9VwIFm+ZwdTKipKeX6ytjmOwTvTuaRQYzks9L+v5pPp
# PW9Ukzv3bD+aBI4jTZO5U/u/6PuFtYBOl/YK5pYKmrkuiPNfHAvjpVTaJQqotZ2i
# Qa5XkvMgZngdJC6lU37lSSTRC1fZrf89BoWhPgRsjLU=
# SIG # End signature block
