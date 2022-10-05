# syntax=docker/dockerfile-upstream:master-labs

FROM quay.io/vexxhost/bindep-loci:latest AS bindep

FROM quay.io/vexxhost/openstack-builder-focal:7d75e6d98979b52546c26111a9783e0150010dc0 AS builder
COPY --from=bindep --link /runtime-pip-packages /runtime-pip-packages

FROM quay.io/vexxhost/openstack-runtime-focal:670bb89aab5863850d4ad83e0b47ad600a2b9268 AS runtime
COPY --from=bindep --link /runtime-dist-packages /runtime-dist-packages
COPY --from=builder --link /var/lib/openstack /var/lib/openstack
