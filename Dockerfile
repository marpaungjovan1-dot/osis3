# Stage 1: Build aplikasi menggunakan Maven dan JDK 17
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY osis/ .
RUN mvn clean package -DskipTests

# Stage 2: Jalankan aplikasi hasil build
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]