FROM debian:buster-slim
RUN useradd -m job && \
    mkdir /home/job/logs /home/job/output && \
    chown -R job:job /home/job
WORKDIR /home/job
COPY primusquery .
RUN chmod u+x /home/job/primusquery
USER job
ENTRYPOINT ["/home/job/primusquery"]
CMD ""