FROM seminar/ctr-exercise-wildfly

COPY --chown=jboss:jboss target/ctr-exercise-rest.war /opt/jboss/wildfly/standalone/deployments

COPY src/main/wildfly/wildfly-setup.cli /opt/jboss

RUN /opt/jboss/wildfly/bin/jboss-cli.sh --file=/opt/jboss/wildfly-setup.cli || exit 0
