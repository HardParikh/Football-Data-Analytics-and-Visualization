#!/bin/bash
set -e

if [ -e "/opt/airflow/requirements.txt" ]; then
    $(command -v pip) install --user -r requirements.txt
fi

# Initialize the database if it hasn't been initialized yet
if [ ! -f "/opt/airflow/airflow.db" ]; then
  airflow db init && \
  airflow users create \
    --username hardparikh \
    --firstname hard \
    --lastname parikh \
    --role Admin \
    --email hpari002@ucr.edu \
    --password Greaccount3#
fi

$(command -v airflow) db upgrade

exec airflow webserver