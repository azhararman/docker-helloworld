FROM eclipse-temurin:17
WORKDIR /usr/src/myapp
COPY HelloWorld.java .
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]