*** Settings ***
Library    RequestsLibrary

*** Variables ***
${base_url}    http://srv3-sso-scc.net.billing.ru:47141
${token_url}   http://srv3-sso-scc.net.billing.ru:47141/openapi/v1/tokens-stub/get?LOGIN=TESTOV&PASSWORD=1111

*** Keywords ***
Get Rate Plans Limit = 500
    [Timeout]    0.5 seconds
    ${headers2}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer eyJraWQiOiJqd3NfaWRfdG9rZW4iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzOTk5MDAwMjYyODI3MjIiLCJhcHBsX2NvZGUiOiJwc19zZXAiLCJhdXRoX3R5cGUiOiJwYXNzd29yZCIsImF1dGhfbGV2ZWwiOjUwMCwiZGVwYXJ0bWVudF9pZCI6OTk5LCJhcHBsX3R5cGUiOiJTQk1TIiwiaXNzIjoiaHR0cHM6Ly9uZXhpZ24uY29tIiwic2Vzc2lvbl9pZCI6Im9hcy03ZGQ2ZjY3NS02MWU0LTQ3MWEtOWZmNS00OTgxYjc1ZDkxNGQiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJURVNUT1YiLCJsb2NhbGUiOiJydSIsImF1ZCI6InBzX3NlcCIsImFjbF9oYXNoIjoiNjljZDg3NDlhODYyYzAxMDkyZTY0NTRiOTU1NmE4OWQ4MmU1NzQxYzUwNzNkM2Q3NjhmOGMwOTU1NTRhZDI5My5wc19zZXAuNTAwIiwiYXBwbF9pZCI6InBzX3NlcCIsInVzZXJfdHlwZV9pZCI6NjAwMjAwMDMsImV4cCI6MTcxNTkzODQxMSwiaWF0IjoxNzE1OTM3ODExLCJqdGkiOiJhLThmMGZmMmMyLTE5Y2UtNGYzNi1hYWZkLTE2OTI3YWFjMTE3NiJ9.LdWRLbEU7UynsKnHuoAdkIu5RshjFshnLjNbVE0HWkuEfKiW3Gksxn1gkI_yR5GF0tZ7jbmk6W40ySHEjzdQzs7FNlehxCCjbtm7w9lxPNbw4tw-Ff4qItMoGg9GsjGNroDE-WaurNvSG4G3tOvU4j0NwvIePcE5Ye8-0e1jBx1_T2PQ6yCt4kQ4MN4gxbWt47K76qpGtv_BguMXWKhrb-lrJZ93H4zQrpEjX1iwqVjygp5Qc-4QwltL1JYRoarHVNM4Q8O2XMzL3ku1j3N1Ry21guj6dAu02u4wRz5ttgqY7DKo4IXmk_LV9BhL3YmSEhxqYgUZatfBzWiEI3OeZw
    ${response}=    GET On Session    alias    openapi/v1/dictionaries/common/ratePlans    params=limit=500  headers=${headers2}


*** Test Cases ***
Test GET Session
    Create Session    tok      ${token_url}
    Create Session    alias    ${base_url}

Test Get Agents
    ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${token}=    GET On Session     tok    ${token_url}  headers=${headers}
     Log    ${token}
    ${headers2}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer eyJraWQiOiJqd3NfaWRfdG9rZW4iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzOTk5MDAwMjYyODI3MjIiLCJhcHBsX2NvZGUiOiJwc19zZXAiLCJhdXRoX3R5cGUiOiJwYXNzd29yZCIsImF1dGhfbGV2ZWwiOjUwMCwiZGVwYXJ0bWVudF9pZCI6OTk5LCJhcHBsX3R5cGUiOiJTQk1TIiwiaXNzIjoiaHR0cHM6Ly9uZXhpZ24uY29tIiwic2Vzc2lvbl9pZCI6Im9hcy03ZGQ2ZjY3NS02MWU0LTQ3MWEtOWZmNS00OTgxYjc1ZDkxNGQiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJURVNUT1YiLCJsb2NhbGUiOiJydSIsImF1ZCI6InBzX3NlcCIsImFjbF9oYXNoIjoiNjljZDg3NDlhODYyYzAxMDkyZTY0NTRiOTU1NmE4OWQ4MmU1NzQxYzUwNzNkM2Q3NjhmOGMwOTU1NTRhZDI5My5wc19zZXAuNTAwIiwiYXBwbF9pZCI6InBzX3NlcCIsInVzZXJfdHlwZV9pZCI6NjAwMjAwMDMsImV4cCI6MTcxNTkzODQxMSwiaWF0IjoxNzE1OTM3ODExLCJqdGkiOiJhLThmMGZmMmMyLTE5Y2UtNGYzNi1hYWZkLTE2OTI3YWFjMTE3NiJ9.LdWRLbEU7UynsKnHuoAdkIu5RshjFshnLjNbVE0HWkuEfKiW3Gksxn1gkI_yR5GF0tZ7jbmk6W40ySHEjzdQzs7FNlehxCCjbtm7w9lxPNbw4tw-Ff4qItMoGg9GsjGNroDE-WaurNvSG4G3tOvU4j0NwvIePcE5Ye8-0e1jBx1_T2PQ6yCt4kQ4MN4gxbWt47K76qpGtv_BguMXWKhrb-lrJZ93H4zQrpEjX1iwqVjygp5Qc-4QwltL1JYRoarHVNM4Q8O2XMzL3ku1j3N1Ry21guj6dAu02u4wRz5ttgqY7DKo4IXmk_LV9BhL3YmSEhxqYgUZatfBzWiEI3OeZw
    ${response}=    GET On Session    alias    openapi/v1/dictionaries/common/ratePlans    headers=${headers2}

Test Expected 200
    ${headers2}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer eyJraWQiOiJqd3NfaWRfdG9rZW4iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzOTk5MDAwMjYyODI3MjIiLCJhcHBsX2NvZGUiOiJwc19zZXAiLCJhdXRoX3R5cGUiOiJwYXNzd29yZCIsImF1dGhfbGV2ZWwiOjUwMCwiZGVwYXJ0bWVudF9pZCI6OTk5LCJhcHBsX3R5cGUiOiJTQk1TIiwiaXNzIjoiaHR0cHM6Ly9uZXhpZ24uY29tIiwic2Vzc2lvbl9pZCI6Im9hcy03ZGQ2ZjY3NS02MWU0LTQ3MWEtOWZmNS00OTgxYjc1ZDkxNGQiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJURVNUT1YiLCJsb2NhbGUiOiJydSIsImF1ZCI6InBzX3NlcCIsImFjbF9oYXNoIjoiNjljZDg3NDlhODYyYzAxMDkyZTY0NTRiOTU1NmE4OWQ4MmU1NzQxYzUwNzNkM2Q3NjhmOGMwOTU1NTRhZDI5My5wc19zZXAuNTAwIiwiYXBwbF9pZCI6InBzX3NlcCIsInVzZXJfdHlwZV9pZCI6NjAwMjAwMDMsImV4cCI6MTcxNTkzODQxMSwiaWF0IjoxNzE1OTM3ODExLCJqdGkiOiJhLThmMGZmMmMyLTE5Y2UtNGYzNi1hYWZkLTE2OTI3YWFjMTE3NiJ9.LdWRLbEU7UynsKnHuoAdkIu5RshjFshnLjNbVE0HWkuEfKiW3Gksxn1gkI_yR5GF0tZ7jbmk6W40ySHEjzdQzs7FNlehxCCjbtm7w9lxPNbw4tw-Ff4qItMoGg9GsjGNroDE-WaurNvSG4G3tOvU4j0NwvIePcE5Ye8-0e1jBx1_T2PQ6yCt4kQ4MN4gxbWt47K76qpGtv_BguMXWKhrb-lrJZ93H4zQrpEjX1iwqVjygp5Qc-4QwltL1JYRoarHVNM4Q8O2XMzL3ku1j3N1Ry21guj6dAu02u4wRz5ttgqY7DKo4IXmk_LV9BhL3YmSEhxqYgUZatfBzWiEI3OeZw
    ${response}=    GET On Session    alias    openapi/v1/dictionaries/common/ratePlans    headers=${headers2}     expected_status=200

Test limit=500 and time=200ms
    Get Rate Plans Limit = 500
