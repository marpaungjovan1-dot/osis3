FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
# Masuk ke folder tempat file pom.xml berada
WORKDIR /app/osis
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
# Ambil file jar dari subfolder osis/target
COPY --from=build /app/osis/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]