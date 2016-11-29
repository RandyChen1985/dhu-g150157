===========================
DHU JAVA-WEB 作业
===========================
技术方案
spring-boot + freemarker + swagger + easyui

1)静态资源static目录下,访问路径 : http://localhost:8888/swagger/index.html




/////
Spring Boot Actuator 所提供的 HTTP 服务
名称	说明	是否包含敏感信息
autoconfig	显示 Spring Boot 自动配置的信息。	是
beans	显示应用中包含的 Spring bean 的信息。	是
configprops	显示应用中的配置参数的实际值。	是
dump	生成一个 thread dump。	是
env	显示从 ConfigurableEnvironment 得到的环境配置信息。	是
health	显示应用的健康状态信息。	否
info	显示应用的基本信息。	否
metrics	显示应用的性能指标。	是
mappings	显示 Spring MVC 应用中通过“
@RequestMapping”添加的路径映射。	是
shutdown	关闭应用。	是
trace	显示应用相关的跟踪（trace）信息。	是

