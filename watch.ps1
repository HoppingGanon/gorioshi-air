
$path = ${PSScriptRoot}
cd $path
$list = ''

while ($true) {
    $prelist = $list
    $list = (ls "${path}\src" -r | ?{$_.Extension -in '.go','.html'} | %{ "$($_.Name) $($_.LastWriteTime)" })
    if ("$list" -ne "$prelist") {
        $ErrorActionPreference = "silentlycontinue"
        docker-compose exec develop bash /develop/script/go/kill.sh
        $ErrorActionPreference = "continue"
    }
    sleep 3
}
