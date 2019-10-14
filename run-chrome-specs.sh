set -ex

rm -f examples.txt

BUCKET=dt_chrome_regression python3 create-example-list.py
EXAMPLES=`cat examples.txt`
echo $EXAMPLES

rspec spec/ $EXAMPLES