FROM alpine:3.2

RUN apk add --update musl python3 py-pip bash && \
    rm /var/cache/apk/*

RUN pip install falcon gunicorn
EXPOSE 5000 8000 80
COPY ./app /app

WORKDIR /app
CMD ["gunicorn", "-b", "0.0.0.0:8000", "-w", "4", "sample:api"]
