Projeto Bookmark usando demoiselle-servlet-parent
=================================================

Premissas
---------
1. Banco de Dados HSQLDB
2. Camada de persistência usando JDBC
3. Camada de serviço usando REST
4. Camada de visão usando HTML5 + Ajax

Passo a passo
-------------

###1. Configurar o pom
<br/>
```
<parent>
    <groupId>br.gov.frameworkdemoiselle</groupId>
	<artifactId>demoiselle-servlet-parent</artifactId>
	<version>2.4.0-BETA2-SNAPSHOT</version>
</parent>
...
<dependencies>
	<dependency>
		<groupId>br.gov.frameworkdemoiselle</groupId>
		<artifactId>demoiselle-core</artifactId>
		<scope>compile</scope>
	</dependency>
	<dependency>
		<groupId>br.gov.frameworkdemoiselle</groupId>
		<artifactId>demoiselle-jdbc</artifactId>
		<scope>compile</scope>
	</dependency>
    <dependency>
		<groupId>br.gov.frameworkdemoiselle.component</groupId>
		<artifactId>demoiselle-junit</artifactId>
		<version>2.3.0</version>
		<scope>test</scope>
	</dependency>
	<dependency>
		<groupId>org.slf4j</groupId>
		<artifactId>slf4j-log4j12</artifactId>
		<scope>test</scope>
	</dependency>
	<dependency>
		<groupId>org.slf4j</groupId>
		<artifactId>slf4j-ext</artifactId>
		<scope>test</scope>
	</dependency>
	<dependency>
		<groupId>commons-logging</groupId>
		<artifactId>commons-logging</artifactId>
		<version>1.1.2</version>
	</dependency>
	<dependency>
		<groupId>com.h2database</groupId>
		<artifactId>h2</artifactId>
		<scope>test</scope>
	</dependency>    
</dependencies>
```

###2. Configurações de persistência
<br/>
No arquivo `demoiselle.properties` adicionar à chave `frameworkdemoiselle.persistence.jndi.name` o datasource configurado para o banco de dados desejado. 
<br/>
```
frameworkdemoiselle.persistence.jndi.name=java:jboss/datasources/ExampleDS
```
<br/>
Obs.: Remover o arquivo persistence.xml

###3. Configurações da camada de serviço
<br/>
Adicionar as seguintes dependências:
<br/>
```
<dependency>
	<groupId>org.jboss.spec.javax.ws.rs</groupId>
	<artifactId>jboss-jaxrs-api_1.1_spec</artifactId>
	<scope>provided</scope>
</dependency>
<dependency>
	<groupId>org.jboss.resteasy</groupId>
	<artifactId>resteasy-jaxrs</artifactId>
	<scope>provided</scope>
</dependency>
<dependency>
	<groupId>org.jboss.resteasy</groupId>
	<artifactId>resteasy-jackson-provider</artifactId>
	<scope>compile</scope>
</dependency>
<dependency>
	<groupId>org.codehaus.jackson</groupId>
	<artifactId>jackson-mapper-asl</artifactId>
	<scope>compile</scope>
</dependency>
```
<br/>
