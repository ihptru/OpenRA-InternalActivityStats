<?php

define('URL', 'http://master.openra.net/games_json');

$data=file_get_contents(URL);
if($data === FALSE) {
    exit(-1);
}

$oraservers=json_decode($data);

$players_playing = 0;
$players_waiting = 0;

foreach($oraservers as $oraserver) {
    switch($oraserver->state) {
        case 1:
            $players_waiting += $oraserver->players;
            break;
        case 2:
            $players_playing += $oraserver->players;
            break;
    }
}

print $players_playing." ".$players_waiting."\n";
exit(0);

?>
