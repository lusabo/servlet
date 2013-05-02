package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.inject.Inject;

import br.gov.frameworkdemoiselle.lifecycle.Startup;
import br.gov.frameworkdemoiselle.transaction.Transactional;

public class DDL {

	@Inject
	private Connection connection;

	@Startup
	@Transactional
	public void dropAndCreate() throws Exception {
		dropTableIfExists("bookmarks");
		createTableBookmarks();
	}

	private void dropTableIfExists(String tableName) throws Exception {
		PreparedStatement pstmt;

		pstmt = connection.prepareStatement("DROP TABLE ? IF EXISTS");
		pstmt.setString(1, tableName);

		pstmt.execute();
		pstmt.close();
	}

	private void createTableBookmarks() throws Exception {
		StringBuffer sql = new StringBuffer();

		sql.append("CREATE TABLE bookmarks ( ");
		sql.append("	id serial NOT NULL, ");
		sql.append("	description character varying(255) NOT NULL, ");
		sql.append("	link character varying(255) NOT NULL, ");
		sql.append("CONSTRAINT bookmarks_pk PRIMARY KEY (id) ");
		sql.append("); ");

		PreparedStatement pstmt = connection.prepareStatement(sql.toString());
		pstmt.execute();
		pstmt.close();
	}

}
