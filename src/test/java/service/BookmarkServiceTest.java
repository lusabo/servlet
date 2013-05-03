package service;

import javax.inject.Inject;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.spec.JavaArchive;
import org.junit.runner.RunWith;

import persistence.BookmarkDAO;
import persistence.DDL;
import business.BookmarkBC;
import entity.Bookmark;

@RunWith(Arquillian.class)
public class BookmarkServiceTest {
	
	@Inject
	BookmarkService bookmarkService;
	
	@Deployment
	public static JavaArchive createDeployment() {
		return ShrinkWrap.create(JavaArchive.class)
				.addClass(Bookmark.class)
				.addClass(BookmarkDAO.class)
				.addClass(DDL.class)
				.addClass(BookmarkBC.class)
				.addClass(BookmarkService.class)
				.addAsManifestResource(EmptyAsset.INSTANCE, "beans.xml");
	}

}
