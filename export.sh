
#!/bin/sh

step=1

for x in `heroku config --app fling-api-staging`; do
 if [[ $step == 1 ]]; then
  name=$x
  step=2
elif [[ $step == 2 ]]; then
  value=$x
  step=1
  echo $name=$value
fi
done
