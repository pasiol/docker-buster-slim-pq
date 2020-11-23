FROM debian:buster-slim
RUN useradd -m job && \
    mkdir /home/job/logs /home/job/output && \
    chown -R job:job /home/job && \
    apt update && \
    apt install -y ca-certificates && \
    update-ca-certificates 
WORKDIR /home/job
COPY primusquery .
RUN chmod u+x /home/job/primusquery
USER job
ENTRYPOINT ["/home/job/primusquery"]
CMD ""