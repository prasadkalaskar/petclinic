FROM openjdk:11.0.5-jdk
WORKDIR /app
EXPOSE 8080
COPY target/pet-clinic-latest.jar pet-clinic-latest.jar
CMD ["java","-Dspring.profiles.active=mysql", "-jar", "/app/pet-clinic-latest.jar"]