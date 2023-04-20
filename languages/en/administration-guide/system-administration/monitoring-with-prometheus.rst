.. _admin_monitoring_with_prometheus:

Monitoring with Prometheus
==========================

.. figure:: ../../images/screenshots/admin_grafana.png
    :align: center
    :alt: Dashboarding with grafana
    :name: Dashboarding of prometheus metrics with grafana

.. attention::

  This module is part of :ref:`Tuleap Entreprise <tuleap-enterprise>`. It might
  not be available on your installation of Tuleap.

Tuleap gathers metrics about usage (number of artifact viewed, created, updated, services access) and exposes them using
`Prometheus <https://prometheus.io/>`_ format. To efficiently exploit them, you should install Prometheus as well as
`Grafana <https://grafana.com/>`_. Installation and configuration of those tools is not covered in this section but well
documented in their respective documentations.

Configuration of Tuleap
-----------------------

First step is to install a Redis server and to configure Tuleap to use it,
checkout :ref:`backend workers guide<installation_redis>`.

After having installed and activated ``tuleap-plugin-prometheus-metrics`` rpm, you need to setup a password to access the
data (by default data are private and there is no ways to make them accessible anonymously). To do so, you need to write
a 16 chars password (minimum) in ``/etc/tuleap/plugins/prometheus_metrics/etc/metrics_secret.key``. Keep this file safe by
making it readable only by ``codendiadm`` user (``chown codendiadm:codendiadm`` && ``chmod 0400``).

You also have to give it to the platform, this name will used as a label in Prometheus so you can be able to filter the
result per platform if you are running multiple Tuleap instances. The name can be something like *staging*, *production*
or just the FQDN of the instance: ``tuleap config-set prometheus_platform <name>``.

Then your instance will output metrics under the ``/metrics`` end-point. For instance if your tuleap is setup under
https://tuleap.example.com, you will metrics them at https://tuleap.example.com/metrics. You will get a basic auth challenge
where username is ``metrics`` and the password is the one set previously.

Using node_exporter
~~~~~~~~~~~~~~~~~~~

Tuleap can also exposes server metrics (CPU, RAM, etc) on the same end point. It's useful because it avoids to make two
configurations in Prometheus and you don't have to make your own reverse proxy to let Prometheus access securely to your
server metrics.

The server metrics are gathered by `node_exporter <https://github.com/prometheus/node_exporter>`_ you can either build
it for yourself or you can use the packages provided in `community-supplied COPR repository <https://copr.fedorainfracloud.org/coprs/ibotty/prometheus-exporters/>`_.

The following example uses COPR repository

.. sourcecode:: bash

    # On RHEL/CentOS 7
    $> curl -Lo /etc/yum.repos.d/_copr_ibotty-prometheus-exporters.repo https://copr.fedorainfracloud.org/coprs/ibotty/prometheus-exporters/repo/epel-7/ibotty-prometheus-exporters-epel-7.repo
    $> yum install -y node_exporter

    # Either run node_exporter manually (nohup node_exporter &) or create systemd service if you want node_exporter to run
    # at server reboot
    # $> nohup node_exporter &

    $> tuleap config-set prometheus_node_exporter http://127.0.0.1:9100/metrics


Then you will see a bunch of data like ``node_cpu_seconds_total`` on ``/metrics`` end-point.

Configuration of Prometheus
---------------------------

The following snippet should be added in your ``prometheus.yml`` config. For more information about Prometheus configuration,
it is recommended to take a look at `Prometheus documentation <https://prometheus.io/docs/prometheus/latest/configuration/configuration/>`_.

.. sourcecode:: yaml

    scrape_configs:

      ...

      - job_name: tuleap
        metrics_path: /metrics
        scheme: https
        basic_auth:
          username: metrics
          password: Some very strong password set by admin
        static_configs:
          - targets:
            - tuleap.example.com

      ...
