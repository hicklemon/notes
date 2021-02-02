#!/bin/bash
curl -sqkILX GET -H "Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-get-request-id" "${1}" | egrep "(X-Check-Cacheable|X-Akamai-Request-ID|X-Cache|X-Cache-Remote|X-Cache-Key)"
