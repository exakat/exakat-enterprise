<?php

$vcs = 'https://www.github.com/'.(getenv('GITHUB_REPOSITORY') ?? 'none/none').'.git';
$format = getenv('INPUT_FORMAT') ?? 'txt';
if (!in_array($format, ['txt', 'sarif'])) { $format = 'txt';}
$token = getenv('INPUT_PROJECT_TOKEN') ?? '';

$json = file_get_contents('https://www.exakat.io/?token='.urlencode($token).'&vcs='.urlencode($vcs));
$init = json_decode($json);

if ($init === null) {
    print 'Initialisation failed for '.$vcs.PHP_EOL;
    die();
}

$tours = 0;
do {
    sleep(rand(0, 10));
    print '.';
    ++$tours;
    if ($tours % 60 === 0) {
        print "\n";
    }

    if ($tours > 1000) {
        break; 
    }

    $json = file_get_contents('https://www.exakat.io/?token='.$init->token.'&format='.$format);
    $report = json_decode($json);
} while ($report === 'No such report yet');

if ($report === 'No such token yet') {
    print "Retrieving the report failed\n";
    die();
}

if ($report === 'No such report yet') {
    print "Waiting for the report failed\n";
    die();
}

$output = getenv('INPUT_OUTPUT') ?? 'stdout';
if ($output === 'stdtout') {
    print json_encode($report, JSON_PRETTY_PRINT);
} else {
    file_put_contents('/github/workspace/'.$output, json_encode($report));
}

?>