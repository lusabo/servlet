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
</dependencies>

###2. Configurações de persistência

No arquivo demoiselle.properties adicionar à chave frameworkdemoiselle.persistence.jndi.name o datasource configurado para o banco de dados desejado. 

frameworkdemoiselle.persistence.jndi.name=java:jboss/datasources/ExampleDS

Obs.: Remover o arquivo persistence.xml

###3. 

