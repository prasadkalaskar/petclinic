FROM openjdk:11.0.5-jdk
ADD *.jar app.jar
ENTRYPOINT java -jar pet-clinic-latest.jar
