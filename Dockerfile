ARG VERSION

#
# builder stage
#
FROM cloudbees/cloudbees-core-mm:$VERSION as builder

USER root
RUN mkdir -p /workspace && chown -R jenkins:jenkins /workspace
USER jenkins

ADD --chown=jenkins:jenkins https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.9.0/jenkins-plugin-manager-2.9.0.jar /workspace/jenkins-plugin-manager.jar

COPY plugins.txt /workspace/plugins.txt

ARG VERSION
RUN JENKINS_UC_HASH_FUNCTION="SHA1" \
    java -jar /workspace/jenkins-plugin-manager.jar \
      --jenkins-version "$VERSION" \
      --jenkins-update-center "https://jenkins-updates.cloudbees.com/update-center/envelope-core-mm" \
      --plugin-file /workspace/plugins.txt

#
# final image stage
#
FROM cloudbees/cloudbees-core-mm:$VERSION
COPY --from=builder /usr/share/jenkins/ref/plugins /usr/share/jenkins/ref/plugins
COPY ./custom-bundle1 /var/custom-casc-bundle/custom-bundle1/
