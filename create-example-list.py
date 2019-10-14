import os
import requests

bucket_service_root = 'http://localhost:8080'
project = 'barracuda'
bucket = os.environ.get('BUCKET')

bucket_service_url = bucket_service_root + '/projects/' + project + '/tests/search/bucket?q=[' + bucket + ']'
r = requests.get(bucket_service_url)

examples = ''
tests = r.json()['tests']
for test in tests:
    print(test['uuid'])
    examples += '--example ' + test['uuid'] + ' '

if len(tests) < 1:
    examples += '--example ZZINVALIDZZ '

filename = "examples.txt"
f = open(filename, "w+")
f.write(examples)
f.close()

# BUCKET=dt_chrome_regression python3 create-example-list.py