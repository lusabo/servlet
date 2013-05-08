package service;

import java.io.File;

import javax.inject.Inject;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.asset.FileAsset;
import org.jboss.shrinkwrap.api.spec.JavaArchive;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;

import persistence.BookmarkDAO;
import persistence.DDL;
import business.BookmarkBC;
import entity.Bookmark;

@RunWith(Arquillian.class)
public class BookmarkServiceTest {
	
	@Inject
	BookmarkService bookmarkService;
	
	@Inject
	BookmarkBC bookmarkBC;
	
	@Deployment
	public static JavaArchive createDeployment() {

		return ShrinkWrap.create(JavaArchive.class)
				.addClass(Bookmark.class)
				.addClass(BookmarkDAO.class)
				.addClass(DDL.class)
				.addClass(BookmarkBC.class)
				.addClass(BookmarkService.class)
				.addPackages(true, "br")
				.addAsResource(new FileAsset(new File("src/main/resources/demoiselle.properties")), "demoiselle.properties")
				.addAsResource(new FileAsset(new File("src/test/resources/test/beans.xml")), "beans.xml");
	}
	
//	@Before
//	public void before() throws Exception {
//		System.out.println("Teste------------------------------------------------");
//		for (Bookmark bookmark : bookmarkService.findAll()) {
//			bookmarkService.delete(bookmark.getId());
//		}
//	}

	@Test
	public void testLoad() {
		Assert.assertTrue(true);
	}
}
