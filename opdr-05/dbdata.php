<?php
$envSettings = [];
if (file_exists(dirname(__FILE__) . '/.env')) {
    $envSettings = parse_ini_file(dirname(__FILE__) . '/.env');
}

// Assign variables from the .env file
$DB_SCHEMA_NAME = isset($envSettings['DB_SCHEMA_NAME']) ? $envSettings['DB_SCHEMA_NAME'] : '';
$DB_USER = isset($envSettings['DB_USER']) ? $envSettings['DB_USER'] : '';
$DB_PASSWORD = isset($envSettings['DB_PASSWORD']) ? $envSettings['DB_PASSWORD'] : '';
$DB_HOST = isset($envSettings['DB_HOST']) ? $envSettings['DB_HOST'] : '';
?>