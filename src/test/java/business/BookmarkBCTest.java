package business;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;

import br.gov.frameworkdemoiselle.junit.DemoiselleRunner;
import entity.Bookmark;

@RunWith(DemoiselleRunner.class)
public class BookmarkBCTest {

	@Inject
	private BookmarkBC bookmarkBC;

	@Before
	public void before() throws Exception {
		for (Bookmark bookmark : bookmarkBC.findAll()) {
			bookmarkBC.delete(bookmark.getId());
		}
	}

	@Test
	public void testLoad() {
		try {
			bookmarkBC.load();
			List<Bookmark> listaBookmarks = bookmarkBC.findAll();
			assertNotNull(listaBookmarks);
			assertEquals(10, listaBookmarks.size());
		} catch (Exception e) {
			Assert.fail(e.getMessage());
		}
	}

	@Test
	public void testInsert() {
		try {
			Bookmark bookmark = new Bookmark("Demoiselle Portal", "http://www.frameworkdemoiselle.gov.br");
			bookmarkBC.insert(bookmark);
			List<Bookmark> listaBookmarks = bookmarkBC.findAll();
			assertNotNull(listaBookmarks);
			assertEquals(1, listaBookmarks.size());
		} catch (Exception e) {
			Assert.fail(e.getMessage());
		}
	}
	
	 @Test
	 public void testDelete() {
		 try {
			 Bookmark bookmark = new Bookmark("Demoiselle Portal", "http://www.frameworkdemoiselle.gov.br");
			 bookmarkBC.insert(bookmark);
			 
			 List<Bookmark> listaBookmarks = bookmarkBC.findAll();
			 assertNotNull(listaBookmarks);
			 assertEquals(1, listaBookmarks.size());
			 
			 bookmarkBC.delete(listaBookmarks.get(0).getId());
			 listaBookmarks = bookmarkBC.findAll();
			 assertEquals(0, listaBookmarks.size());
		} catch (Exception e) {
			Assert.fail(e.getMessage());
		}
	 }
	
	 @Test
	 public void testUpdate() {
		 try {
			 Bookmark bookmark = new Bookmark("Demoiselle Portal", "http://www.frameworkdemoiselle.gov.br");
			 bookmarkBC.insert(bookmark);
			 
			 List<Bookmark> listaBookmarks = bookmarkBC.findAll();
			 Bookmark bookmark2 = (Bookmark) listaBookmarks.get(0);
			 assertNotNull(listaBookmarks);
			 assertEquals("Demoiselle Portal", bookmark2.getDescription());
			 
			 bookmark2.setDescription("Demoiselle Portal alterado");
			 bookmarkBC.update(bookmark2);
			 
			 listaBookmarks = bookmarkBC.findAll();
			 Bookmark bookmark3 = (Bookmark) listaBookmarks.get(0);
			 assertEquals("Demoiselle Portal alterado", bookmark3.getDescription());
		} catch (Exception e) {
			Assert.fail(e.getMessage());
		}
	 }
	
}
