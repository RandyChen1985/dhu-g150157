package xin.xlchen.dhu.stumanger.config;

import com.mangofactory.swagger.configuration.SpringSwaggerConfig;
import com.mangofactory.swagger.models.dto.ApiInfo;
import com.mangofactory.swagger.plugin.EnableSwagger;
import com.mangofactory.swagger.plugin.SwaggerSpringMvcPlugin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableSwagger
@EnableAutoConfiguration
public class SwaggerConfig
{

    private SpringSwaggerConfig springSwaggerConfig;

    @Autowired
    public void setSpringSwaggerConfig(SpringSwaggerConfig springSwaggerConfig) {
        this.springSwaggerConfig = springSwaggerConfig;
    }

    @Bean
    public SwaggerSpringMvcPlugin customImplementation(){
        return  new SwaggerSpringMvcPlugin(this.springSwaggerConfig)
                .apiInfo(apiInfo())
                .useDefaultResponseMessages(false)
                .includePatterns("/admin/service.*");
    }
    
    private ApiInfo apiInfo() {
    	  ApiInfo apiInfo = new ApiInfo(
    	          "接口服务中心",
    	          "提供给前端调用的相关Restful接口",
    	          "by g150157",
    	          "g150157@mail.dhu.edu.cn",
    	          "",
    	          ""
    	    );
    	  return apiInfo;
    	}
}