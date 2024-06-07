*** Settings ***
Library    RequestsLibrary

*** Variables ***
${base_url}    http://srv3-sso-scc.net.billing.ru:47141
${token_url}   http://srv3-sso-scc.net.billing.ru:47141/openapi/v1/tokens-stub/get?LOGIN=TESTOV&PASSWORD=1111

*** Keywords ***
Get Agent
    [Timeout]    0.5 seconds
    ${headers2}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer eyJraWQiOiJqd3NfaWRfdG9rZW4iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzOTk5MDAwMjYyODI3MjIiLCJhcHBsX2NvZGUiOiJwc19zZXAiLCJhdXRoX3R5cGUiOiJwYXNzd29yZCIsImF1dGhfbGV2ZWwiOjUwMCwiZGVwYXJ0bWVudF9pZCI6OTk5LCJhcHBsX3R5cGUiOiJTQk1TIiwiaXNzIjoiaHR0cHM6Ly9uZXhpZ24uY29tIiwic2Vzc2lvbl9pZCI6Im9hcy04ZmViMmQ0Ny1kNGE4LTQ1YzAtOTE4Yy03ZDBjMzI3ODE1YTYiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJURVNUT1YiLCJsb2NhbGUiOiJydSIsImF1ZCI6InBzX3NlcCIsImFjbF9oYXNoIjoiNjljZDg3NDlhODYyYzAxMDkyZTY0NTRiOTU1NmE4OWQ4MmU1NzQxYzUwNzNkM2Q3NjhmOGMwOTU1NTRhZDI5My5wc19zZXAuNTAwIiwiYXBwbF9pZCI6InBzX3NlcCIsInVzZXJfdHlwZV9pZCI6NjAwMjAwMDMsImV4cCI6MTcxNTkzNjgwMCwiaWF0IjoxNzE1OTM2MjAwLCJqdGkiOiJhLWUzMmQxYjU4LTJkODAtNDRhOC04YzE3LWU3ZjdmOWE0MzQ5MyJ9.MInxEwI3iHKR52ie7lIzkzy-NLvPFcQ-gl1pRqWf8W4aYXcEjtU2y_MDVLgQeTvFVVTUskpQ5Wk_yJNFf6sgPhlw1D9H5TsFYxm_zb1y1lt0eHQc0a-VKqS5e8wsY9FkrcGpOzTT12hU_MClWkDEcvSOzaMPVPKqPgg0tppO_mMrl-ouzQs5oaBU_7zI6qOdCGihDedkZrEjXqPrYVJrJCHLkuZ4YrNO45msBfYYYKL36H2HykJCuK8zd8jTA5KQlBwu4cIlOZZVXQ44GqqnNZ4bhp3Az3Vu4S3cVESFdvTiuzfa2nSP8gHihZhkUVrxfuyCxwWFzmKE9jcC5EikZQ
    ${response}=    GET On Session    alias    openapi/v1/agents/    headers=${headers2}
    
*** Test Cases ***
Test GET Session
    Create Session    tok      ${token_url}
    Create Session    alias    ${base_url}


Test Get Agents
    ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json
    ${token}=    GET On Session     tok    ${token_url}  headers=${headers}
     Log    ${token}
    ${headers2}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer eyJraWQiOiJqd3NfaWRfdG9rZW4iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzOTk5MDAwMjYyODI3MjIiLCJhcHBsX2NvZGUiOiJwc19zZXAiLCJhdXRoX3R5cGUiOiJwYXNzd29yZCIsImF1dGhfbGV2ZWwiOjUwMCwiZGVwYXJ0bWVudF9pZCI6OTk5LCJhcHBsX3R5cGUiOiJTQk1TIiwiaXNzIjoiaHR0cHM6Ly9uZXhpZ24uY29tIiwic2Vzc2lvbl9pZCI6Im9hcy04ZmViMmQ0Ny1kNGE4LTQ1YzAtOTE4Yy03ZDBjMzI3ODE1YTYiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJURVNUT1YiLCJsb2NhbGUiOiJydSIsImF1ZCI6InBzX3NlcCIsImFjbF9oYXNoIjoiNjljZDg3NDlhODYyYzAxMDkyZTY0NTRiOTU1NmE4OWQ4MmU1NzQxYzUwNzNkM2Q3NjhmOGMwOTU1NTRhZDI5My5wc19zZXAuNTAwIiwiYXBwbF9pZCI6InBzX3NlcCIsInVzZXJfdHlwZV9pZCI6NjAwMjAwMDMsImV4cCI6MTcxNTkzNjgwMCwiaWF0IjoxNzE1OTM2MjAwLCJqdGkiOiJhLWUzMmQxYjU4LTJkODAtNDRhOC04YzE3LWU3ZjdmOWE0MzQ5MyJ9.MInxEwI3iHKR52ie7lIzkzy-NLvPFcQ-gl1pRqWf8W4aYXcEjtU2y_MDVLgQeTvFVVTUskpQ5Wk_yJNFf6sgPhlw1D9H5TsFYxm_zb1y1lt0eHQc0a-VKqS5e8wsY9FkrcGpOzTT12hU_MClWkDEcvSOzaMPVPKqPgg0tppO_mMrl-ouzQs5oaBU_7zI6qOdCGihDedkZrEjXqPrYVJrJCHLkuZ4YrNO45msBfYYYKL36H2HykJCuK8zd8jTA5KQlBwu4cIlOZZVXQ44GqqnNZ4bhp3Az3Vu4S3cVESFdvTiuzfa2nSP8gHihZhkUVrxfuyCxwWFzmKE9jcC5EikZQ
    ${response}=    GET On Session    alias    openapi/v1/agents/    headers=${headers2}
    Log    ${response.json()}
Test Expect 200
    ${headers2}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer eyJraWQiOiJqd3NfaWRfdG9rZW4iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzOTk5MDAwMjYyODI3MjIiLCJhcHBsX2NvZGUiOiJwc19zZXAiLCJhdXRoX3R5cGUiOiJwYXNzd29yZCIsImF1dGhfbGV2ZWwiOjUwMCwiZGVwYXJ0bWVudF9pZCI6OTk5LCJhcHBsX3R5cGUiOiJTQk1TIiwiaXNzIjoiaHR0cHM6Ly9uZXhpZ24uY29tIiwic2Vzc2lvbl9pZCI6Im9hcy04ZmViMmQ0Ny1kNGE4LTQ1YzAtOTE4Yy03ZDBjMzI3ODE1YTYiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJURVNUT1YiLCJsb2NhbGUiOiJydSIsImF1ZCI6InBzX3NlcCIsImFjbF9oYXNoIjoiNjljZDg3NDlhODYyYzAxMDkyZTY0NTRiOTU1NmE4OWQ4MmU1NzQxYzUwNzNkM2Q3NjhmOGMwOTU1NTRhZDI5My5wc19zZXAuNTAwIiwiYXBwbF9pZCI6InBzX3NlcCIsInVzZXJfdHlwZV9pZCI6NjAwMjAwMDMsImV4cCI6MTcxNTkzNjgwMCwiaWF0IjoxNzE1OTM2MjAwLCJqdGkiOiJhLWUzMmQxYjU4LTJkODAtNDRhOC04YzE3LWU3ZjdmOWE0MzQ5MyJ9.MInxEwI3iHKR52ie7lIzkzy-NLvPFcQ-gl1pRqWf8W4aYXcEjtU2y_MDVLgQeTvFVVTUskpQ5Wk_yJNFf6sgPhlw1D9H5TsFYxm_zb1y1lt0eHQc0a-VKqS5e8wsY9FkrcGpOzTT12hU_MClWkDEcvSOzaMPVPKqPgg0tppO_mMrl-ouzQs5oaBU_7zI6qOdCGihDedkZrEjXqPrYVJrJCHLkuZ4YrNO45msBfYYYKL36H2HykJCuK8zd8jTA5KQlBwu4cIlOZZVXQ44GqqnNZ4bhp3Az3Vu4S3cVESFdvTiuzfa2nSP8gHihZhkUVrxfuyCxwWFzmKE9jcC5EikZQ
    ${response}=    GET On Session    alias    openapi/v1/agents/    headers=${headers2}    expected_status=200

Test 500 ms
    Get Agent