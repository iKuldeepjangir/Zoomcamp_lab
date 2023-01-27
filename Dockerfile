FROM python:3.9.1

RUN apt-get install wget
COPY ZscalerRoot.crt .
RUN pip config set global.cert ./ZscalerRoot.crt 
RUN pip install pandas sqlalchemy psycopg2 pyarrow

WORKDIR /app
COPY ingest_data.py ingest_data.py 

ENTRYPOINT [ "python", "ingest_data.py" ]

USER root
COPY ZscalerRoot.crt /usr/local/share/ca-certificates/ZscalerRoot.crt
RUN update-ca-certificates
