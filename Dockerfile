FROM datastax/dse-opscenter:6.5.2

ADD custom-entrypoint.sh /

ENTRYPOINT [ "/custom-entrypoint.sh"]