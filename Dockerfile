FROM gcr.io/cloudshell-images/cloudshell:latest
RUN sudo apt-get update -y \
    && sudo apt-get install software-properties-common curl git mc vim facter aptitude apt-utils apt-transport-https ca-certificates gnupg -y \
    && curl https://pyenv.run | bash \
    && echo '' >> ~/.bashrc \
    && echo 'export PYENV_ROOT="~/.pyenv"' >> ~/.bashrc \
    && echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(pyenv init -)"' >> ~/.bashrc \
    && echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc \
    && bash -l ~/.bashrc \
    && ~/.pyenv/bin/pyenv install 3.10.2 \
    && ~/.pyenv/bin/pyenv global 3.10.2 \
    && ~/.pyenv/bin/pyenv virtualenv 3.10.2 apigeex \
    && bash -l ~/.bashrc

VOLUME /bootstrap-runtime
WORKDIR /bootstrap-runtime
COPY molecule /bootstrap-runtime/molecule/
COPY docker-helper /bootstrap-runtime/docker-helper/
COPY resources /bootstrap-runtime/resources/
RUN bash -l /bootstrap-runtime/docker-helper/docker-helper-activate-apigee.sh \
    && mkdir -p work_dir \
    && chmod -R +w work_dir\
    && pip install -r docker-helper/docker-helper-requirements.txt

ENTRYPOINT bash
