FROM adoptopenjdk:11.0.5_10-jre-hotspot

RUN rm /usr/bin/curl

RUN useradd -ms /bin/bash topmeapi
USER topmeapi
WORKDIR /home/topmeapi

ARG DEPENDENCY
COPY ${DEPENDENCY}/BOOT-INF/lib ./app/lib
COPY ${DEPENDENCY}/META-INF ./app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes ./app

ENTRYPOINT ["sh","-c","java -Djava.security.egd=file:/dev/./urandom \
                            -Dsun.net.inetaddr.ttl=0 \
                            -XX:MaxRAMPercentage=80.0 \
                            $JAVA_OPTS \
                            -cp app:app/lib/* com.example.demo.DemoApplicationKt"]
