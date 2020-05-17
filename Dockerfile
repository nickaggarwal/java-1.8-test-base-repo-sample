FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN

RUN apk add --update openssl

# Pre build commands
USER root
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/backend-project/springboot/maven/1.5.x/pre-build.sh
RUN chmod 775 ./pre-build.sh
RUN sh pre-build.sh

COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/

# Add extra docker commands here (if any)...

# Run the app
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/test-project/springboot/maven/1.5.x/run-test.sh
RUN chmod 775 ./run.sh
CMD sh run.sh