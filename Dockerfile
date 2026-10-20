FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
WORKDIR /app/osis
# Tambahkan flag -Dmaven.test.skip=true biar test dibypass total
RUN mvn clean package -DskipTests -Dmaven.test.skip=true

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=build /app/osis/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]