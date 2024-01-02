FROM openjdk:17-oracle
WORKDIR /app
EXPOSE 8080
COPY target/pet-clinic-latest.jar ./pet-clinic-latest.jar
CMD ["java","-DSPRING_PROFILES_ACTIVE=mysql", "-jar", "/app/pet-clinic-latest.jar"]
