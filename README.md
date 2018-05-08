# Example application #

A simple Spring Boot application that sports a REST API and does persistence using JPA.

This project is based on Spring Boot's [HATEOAS example](https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples/spring-boot-sample-hateoas).

## Começando

Para você começar, você pode simplesmente clonar o repositório `prova` e instalar as dependências.

### Pré-requisitos

Você precisa do git para clonar o repositório `prova`. Você pode obter a última versão do git [aqui](https://git-scm.com/downloads).

O `JDK 8` utilizado para compilar o projeto na versão 8u171 e pode ser obtido [aqui](http://www.oracle.com/technetwork/pt/java/javase/downloads/jdk8-downloads-2133151.html)

Como ferramenta de desenvolvimento foi usado o `Eclipse na versão STS 3.9.4.RELEASE`. Você pode obter [aqui](https://spring.io/tools/sts/all)

Gerenciamento de dependências `Maven na versão 3.5.3` [aqui](https://maven.apache.org/download.cgi)

O banco de dados relacional usado foi `PostgreSQL na versão 9.6.8-4` . Você pode obter [aqui](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

### Instalar Maven

Segue o tutorial oficial para instalação do maven [link](https://maven.apache.org/install.html)

### Instalar Dependências

Para instalar as dependências basta rodar o seguinte comando

```
mvn install -U
```

### Executando os Testes

Para executar os testes basta executar a classe `SampleHateoasApplicationTests` com `JUnit`.

```java
package sample.hateoas;

import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
public class SampleHateoasApplicationTests {

	@Autowired
	private TestRestTemplate restTemplate;

	@Test
	public void hasHalLinks() {
		ResponseEntity<String> entity = this.restTemplate.getForEntity("/customers/1",
				String.class);
		assertThat(entity.getStatusCode()).isEqualTo(HttpStatus.OK);
		assertThat(entity.getBody()).startsWith(
				"{\"id\":1,\"firstName\":\"John\"" + ",\"lastName\":\"Lennon\"");
		assertThat(entity.getBody()).contains("_links\":{\"self\":{\"href\"");
	}

	@Test
	public void producesJsonWhenXmlIsPreferred() {
		HttpHeaders headers = new HttpHeaders();
		headers.set(HttpHeaders.ACCEPT, "application/xml;q=0.9,application/json;q=0.8");
		HttpEntity<?> request = new HttpEntity<>(headers);
		ResponseEntity<String> response = this.restTemplate.exchange("/customers/1",
				HttpMethod.GET, request, String.class);
		assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
		assertThat(response.getHeaders().getContentType())
				.isEqualTo(MediaType.parseMediaType("application/json;charset=UTF-8"));
	}

}

```

