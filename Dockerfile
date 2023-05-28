FROM openjdk:8-jdk-alpine
ADD target/sentiment-analysis-web-0.0.1.jar /
EXPOSE 8088
CMD ["java", "-jar", "sentiment-analysis-web-0.0.1.jar"]

