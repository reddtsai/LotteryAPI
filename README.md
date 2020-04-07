# Lottery API

Sample API provides information about lottery tw, based on .NET Core, publish in compute engine of GCP.

## Getting Started

- Get localhost:5000/api/lotto649/{term}
    |field|type|desc|
    |-|-|-|
    |term|int|期別|
    |no1|int|奬號一|
    |no2|int|奬號二|
    |no3|int|奬號三|
    |no4|int|奬號四|
    |no5|int|奬號五|
    |no6|int|奬號六|
    |noS|int|特別號|
    |creater|string||
    |createDate|date||
    ``` json
    {
        "term": 109000035,
        "no1": 2,
        "no2": 45,
        "no3": 32,
        "no4": 43,
        "no5": 47,
        "no6": 17,
        "noS": 34,
        "creater": "Redd",
        "createDate": "2020-04-04T01:00:27"
    }
    ```

