package photoGallary;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CategoryDomain;

@WebServlet("/jsp/photogallary/modifyformphotogallarycategorylist")
public class ModifyFormPhotoGallaryCategoryListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			int homepageNo = -1;
			int categoryGroupNo = 1;
			int categoryNo = -1;
			try {
				homepageNo = Integer.parseInt(request.getParameter("homepage_no"));
				categoryNo = Integer.parseInt(request.getParameter("category_no"));
			} catch (NumberFormatException e) {	}
			
			GallaryDAO dao = new GallaryDAO();
			List<CategoryDomain> list = dao.listCategory(homepageNo, categoryGroupNo);
			
			request.setAttribute("homepage_no", request.getParameter("homepage_no"));
			request.setAttribute("list", list);
			request.setAttribute("category_group_no", categoryGroupNo);
			request.setAttribute("category_no", categoryNo);
			
			RequestDispatcher rd = request.getRequestDispatcher(
				"/jsp/listCategory/modifyPhotoGallaryCategoryList.jsp"	
			);
			
			rd.forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}






