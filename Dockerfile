FROM redhat-sso-7/sso70-openshift:latest
RUN cd /opt/eap/modules/system/add-ons/keycloak && \
  ZIPFILE=/tmp/keycloak-module.zip && \
  curl -k ${ARTIFACT_URL} -o ${ZIPFILE} && \
  unzip ${ZIPFILE} && \
  sed -i '/<dependencies>/a <module name="org.keycloak.examples.userprops" services="import“/>' /opt/eap/modules/system/add-ons/keycloak/org/keycloak/keycloak-services/main/module.xml
