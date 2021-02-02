#!/usr/bin/env bash
function __curl {
    read -p "HTTP_HOST Header: " HTTP_HOST
    read -p "Full URL: " URL
    curl -sqkILX GET -w "@curloptions" -H "Host: ${HTTP_HOST}" "${URL}"
}

__curl
