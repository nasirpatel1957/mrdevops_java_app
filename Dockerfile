FROM openjdk:8-jdk-alphine
WORKDIR /app
COPY ./target/*.jar /app.jar
CMD ["java", "-jar", "app.jar"]