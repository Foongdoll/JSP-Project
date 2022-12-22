package artGesifan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArtGesifanUpdateCommand implements ArtInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		ArtGesifanDAO dao = new ArtGesifanDAO();
		ArtGesifanVO vo = new ArtGesifanVO();
		
		vo = dao.getGesifanContent(idx);
		
		String hashTag = vo.getHashTag();
		String[] hashTags = hashTag.split("/hash/");
		String resHashTag = "";
		
		for(int i = 0; i < hashTags.length; i++) {
			resHashTag += "#"+hashTags[i] + " ";
		}

		
		request.setAttribute("vo", vo);
		request.setAttribute("resHashTag", resHashTag);
		
	}
}
