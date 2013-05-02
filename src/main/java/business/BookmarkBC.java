package business;

import java.util.List;

import javax.inject.Inject;

import persistence.BookmarkDAO;
import br.gov.frameworkdemoiselle.lifecycle.Startup;
import br.gov.frameworkdemoiselle.stereotype.BusinessController;
import br.gov.frameworkdemoiselle.transaction.Transactional;
import entity.Bookmark;

@BusinessController
public class BookmarkBC {

	@Inject
	private BookmarkDAO bookmarkDAO;

	@Transactional
	public void insert(Bookmark bookmark) throws Exception {
		bookmarkDAO.insert(bookmark);
	}

	@Transactional
	public void delete(Long id) throws Exception {
		bookmarkDAO.delete(id);
	}

	@Transactional
	public void update(Bookmark bookmark) throws Exception {
		bookmarkDAO.update(bookmark);
	}

	public Bookmark findById(Long id) throws Exception {
		return bookmarkDAO.findById(id);
	}

	public List<Bookmark> findAll() throws Exception {
		return bookmarkDAO.findAll();
	}

	@Startup
	@Transactional
	public void load() throws Exception {
		if (findAll().isEmpty()) {
			insert(new Bookmark("Demoiselle Portal", "http://www.frameworkdemoiselle.gov.br"));
			insert(new Bookmark("Demoiselle SourceForge", "http://sf.net/projects/demoiselle"));
			insert(new Bookmark("Twitter", "http://twitter.frameworkdemoiselle.gov.br"));
			insert(new Bookmark("Blog", "http://blog.frameworkdemoiselle.gov.br"));
			insert(new Bookmark("Wiki", "http://wiki.frameworkdemoiselle.gov.br"));
			insert(new Bookmark("Bug Tracking", "http://tracker.frameworkdemoiselle.gov.br"));
			insert(new Bookmark("Forum", "http://forum.frameworkdemoiselle.gov.br"));
			insert(new Bookmark("SVN", "http://svn.frameworkdemoiselle.gov.br"));
			insert(new Bookmark("Maven", "http://repository.frameworkdemoiselle.gov.br"));
			insert(new Bookmark("Downloads", "http://download.frameworkdemoiselle.gov.br"));
		}
	}

}
