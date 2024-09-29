<?php

require_once(__DIR__ . "/vendor/autoload.php");

$STREAM_API_KEY = "<STREAM_APP_KEY>";
$STREAM_API_SECRET = "<STREAM_API_SECRET>";

// Initialize the SDK
$client = new \GetStream\StreamChat\Client(
   $STREAM_API_KEY,
   $STREAM_API_SECRET
);

if (isset($_REQUEST["create-token"])) {
  die(json_encode([
     "status" => "success",
     "token"  => $client->createToken($_REQUEST["create-token"])
  ]));
}