FROM adoptopenjdk/openjdk11:jdk-11.0.3_7 as galleon

ENV GALLEON_VERSION 4.2.5.Final

# Install CURL and UNZIP
RUN apt-get update && apt-get install -y curl unzip

# Download wildfly galleon tool, using provisioning.xml and starting galleron
RUN curl -Ls https://github.com/wildfly/galleon/releases/download/${GALLEON_VERSION}/galleon-${GALLEON_VERSION}.zip -o /tmp/galleon.zip && \
    unzip /tmp/galleon.zip && \
    mv /galleon-${GALLEON_VERSION} /galleon
COPY provisioning.xml /tmp/provisioning.xml
RUN /galleon/bin/galleon.sh provision /tmp/provisioning.xml --dir=/tmp/wildfly --verbose

# Using openJDK Alpine (slim version)
FROM adoptopenjdk/openjdk11:jdk-11.0.3_7-alpine-slim

# Create a user (depending on the selected os)
RUN adduser -h /opt/jboss -D jboss

COPY --from=galleon --chown=jboss:jboss /tmp/wildfly /opt/jboss/wildfly

# use user jboss, not root anymore
USER jboss

# Starting Wildfly
ENTRYPOINT [ "/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0" ]