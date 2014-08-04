#!/usr/bin/env bash
#
# example of shall being embedded in a script (instead of sourcing it)
# the block below has been created with the command
# $ gzip -c < shall |base64|sed -e '1i\SHALLSTART' -e '$a\SHALLEND' -e 's/^/#/'
# end can be decoded and applied to the local script using
# $ eval "$(sed -n -e '/^#SHALLSTART/,/^#SHALLEND/p' "$0"|sed -e '/^#SHALL/d' -e 's/^#//'|base64 -d -|gzip -dc -)"
# (see below)
#

#SHALLSTART
#H4sIADPa3lMAA5VUXW+bMBR951dcUSSSdaQf2xNVtlVVs1ZpGynttJdoyIVLQAE7xSZd1PS/79oQ
#IE1VaUgJ+H4e33PsA+sAchEuUj6HUOQ545GExzVIVErbyiWwLGUSJShhIiEueahSwaV1QMmCZ2t4
#FsVCQhrDWpQQsixraz2nKhGlAvYoZJkphCVTiRwMBuD3qICpERbIyMO2WaYPefSr17deLKAnzKOh
#7ZzYZqFYMUdF69NqHdxfnd/cBLeTi/E9Wc2yWjlVKFRxBFGtlwh2bbbh9NtRhKsjXmbZZl7gErwn
#cFNJYLb7dM9AJchNvn502WD06+6CGvUwTAR4uiDh6/Vn/GXGty1nzo8Zf7X7VWvMJDY1Si41Jp1k
#/3fhTtE4tcz799X1xdXQ6T0naZiATukb+2R6/XO/pCjSedCta9Lf4P1gpCaf0uuh4oplhLPptWNt
#NmVbrxXbBeZiRWxrlRjiK761nIKS68+AfA3vsSggh5SD00V0BpGwurN0crOMBMd9+K6rm1fdS861
#sBlIemUICiWpk0QXCW1/FGKxQFzStwZE4Q8U0KIhUbQyrCbKwZ7WVR3tJ203arONxX4jIZMnFs06
#ow3UgCfjw8N9vZiEmKXZeymj8+ubOqmzc20N7s5vLxv2ujYDCxoRvTbDkYYYPRQJEcYpJ3qYbA6D
#Oc/gan/g7jg4y+lwF5Tyl2rpABpKM7cOgOHxW0sNk1jqOCbjOlALIDYC6EUYZqxA8EabkO4UL5oB
#ePEXrzq57p8K1kaKQvU7CqGaNY+aD3tXKHqQVUf6DZ2Whu7QWrbtKep7TPrgNFlmXD3Z/wxtOsgy
#DBEjjFqrrmRYxGhQ32Ma047bwyc4hs2m7jaiaC0sQ4gP+0R+WGfLa4LZEoudm9tiUmKhJuOGovrA
#fjIHtfLq7u/4OyxNLx+Gzvd9DGSng4E1BFilvpLDr75U9IfKZ6lv/QP/yy6jewYAAA==
#SHALLEND
eval "$(sed -n -e '/^#SHALLSTART/,/^#SHALLEND/p' "$0"|sed -e '/^#SHALL/d' -e 's/^#//'|base64 -d -|gzip -dc -)"

# just to proof that shall is actually there..
test_noop()
{
    assertOK true
}

testRun
