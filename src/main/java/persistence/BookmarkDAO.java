package persistence;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.gov.frameworkdemoiselle.stereotype.PersistenceController;
import br.gov.frameworkdemoiselle.transaction.Transactional;
import entity.Bookmark;

@PersistenceController
public class BookmarkDAO implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private Connection connection;

	@Transactional
	public void insert(Bookmark bookmark) throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("insert into bookmarks (description, link) ");
		sql.append("values (?, ?)");

		PreparedStatement pstmt = connection.prepareStatement(sql.toString());
		pstmt.setString(1, bookmark.getDescription());
		pstmt.setString(2, bookmark.getLink());

		pstmt.execute();
		pstmt.close();
	}

	@Transactional
	public void delete(Long id) throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("delete from bookmarks where id = ?");

		PreparedStatement pstmt = connection.prepareStatement(sql.toString());
		pstmt.setLong(1, id);

		pstmt.execute();
		pstmt.close();
	}

	@Transactional
	public void update(Bookmark bookmark) throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("update bookmarks set ");
		sql.append("description = ?, link = ? ");
		sql.append("where id = ? ");

		PreparedStatement pstmt = connection.prepareStatement(sql.toString());
		pstmt.setString(1, bookmark.getDescription());
		pstmt.setString(2, bookmark.getLink());
		pstmt.setLong(3, bookmark.getId());

		pstmt.execute();
		pstmt.close();
	}

	public Bookmark findById(Long id) throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from bookmarks where id = ?");

		PreparedStatement pstmt = connection.prepareStatement(sql.toString());
		pstmt.setLong(1, id);

		ResultSet rs = pstmt.executeQuery();
		Bookmark result = null;

		if (rs.next()) {
			result = new Bookmark();
			result.setId(rs.getLong("id"));
			result.setDescription(rs.getString("description"));
			result.setLink(rs.getString("link"));
		}

		rs.close();
		pstmt.close();

		return result;
	}

	public List<Bookmark> findAll() throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from bookmarks");

		PreparedStatement pstmt = connection.prepareStatement(sql.toString());

		ResultSet rs = pstmt.executeQuery();
		List<Bookmark> result = new ArrayList<Bookmark>();

		while (rs.next()) {
			Bookmark bookmark = new Bookmark();
			bookmark.setId(rs.getLong("id"));
			bookmark.setDescription(rs.getString("description"));
			bookmark.setLink(rs.getString("link"));
			result.add(bookmark);
		}

		rs.close();
		pstmt.close();
		return result;
	}

}
