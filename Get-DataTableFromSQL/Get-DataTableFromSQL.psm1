function Get-DataTableFromSQL($sql,$cs){
    $dt = new-object System.Data.DataTable
    $da = new-object System.Data.SqlClient.SqlDataAdapter $sql,$cs 
    $da.SelectCommand.CommandTimeout = 300
    $null = $da.Fill($dt)
    $null = $da.Dispose()
    return ,$dt # https://stackoverflow.com/questions/13974676/why-does-powershell-think-im-trying-to-return-an-object-rather-then-a-datatab
}
Export-ModuleMember -Function Get-DataTableFromSQL