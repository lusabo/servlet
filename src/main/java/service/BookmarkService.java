package service;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import business.BookmarkBC;
import entity.Bookmark;

@Path("/bookmarks")
public class BookmarkService {

	@Inject
	private BookmarkBC bookmarkBC;

	@GET
	@Produces("application/json;charset=UTF-8")
	public List<Bookmark> findAll() throws Exception {
		return bookmarkBC.findAll();
	}

	@GET
	@Path("/{id}")
	@Produces("application/json;charset=UTF-8")
	public Bookmark findById(@PathParam("id") Long id) throws Exception {
		return bookmarkBC.findById(id);
	}

	@POST
	@Consumes("application/json;charset=UTF-8")
	public void insert(Bookmark bookmark) throws Exception {
		bookmarkBC.insert(bookmark);
	}

	@PUT
	@Consumes("application/json;charset=UTF-8")
	public void update(Bookmark bookmark) throws Exception {
		bookmarkBC.update(bookmark);
	}

	@DELETE
	@Path("/{id}")
	public void delete(@PathParam("id") Long id) throws Exception {
		bookmarkBC.delete(id);
	}
}
