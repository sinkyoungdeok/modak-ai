FROM python:3.7

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
            postgresql-client \
	        && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
RUN pip install --upgrade pip
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
COPY . .

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]