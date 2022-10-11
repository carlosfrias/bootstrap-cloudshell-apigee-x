FROM gcr.io/friasc-apigee-lab/bootstrap-project
VOLUME /bootstrap-runtime
WORKDIR /bootstrap-runtime
COPY molecule /bootstrap-runtime/molecule/
COPY docker-helper /bootstrap-runtime/docker-helper/
COPY resources /bootstrap-runtime/resources/
RUN bash -l /bootstrap-runtime/docker-helper/docker-helper-activate-apigee.sh \
    && mkdir -p work_dir \
    && chmod -R +w work_dir
ENTRYPOINT bash
