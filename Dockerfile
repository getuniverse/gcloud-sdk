FROM google/cloud-sdk:198.0.0
ENV CLOUD_SDK_VERSION 198.0.0
COPY ./bin/setupgcloud /usr/bin/

CMD ["/bin/bash"]