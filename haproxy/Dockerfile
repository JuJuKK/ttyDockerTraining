FROM haproxy

ENV HAPROXY_USER haproxy

#RUN groupadd --system ${HAPROXY_USER} && \
#  echo "Group $HAPROXY_USER added" && \
#  useradd --system --gid ${HAPROXY_USER} ${HAPROXY_USER} && \
#  grep haproxy /etc/group && \
#  mkdir --parents /var/lib/${HAPROXY_USER} && \
#  chown -R ${HAPROXY_USER}:${HAPROXY_USER} /var/lib/${HAPROXY_USER}

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
